using System;
using System.Data.SqlClient;
using System.Windows.Forms;
using System.Data;

namespace P01_SAD
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            AtualizarDados();
        }

        private void AtualizarDados()
        {
            string connectionString = "Server=DESKTOP-D6VVOOR;Database=P01-SAD;Trusted_Connection=True;";
            string query = @"
                SELECT c.NIF, 
                       c.Nome AS NomeCliente, 
                       c.cp AS CodigoPostal, 
                       ISNULL(email.numero_c, 'Sem Email') AS Email, 
                       STRING_AGG(telefone.numero_c, ', ') WITHIN GROUP (ORDER BY telefone.numero_c) AS Telefones
                FROM cliente c
                LEFT JOIN contacto email ON c.NIF = email.NIF AND email.tipo_contacto_id = 2
                LEFT JOIN contacto telefone ON c.NIF = telefone.NIF AND telefone.tipo_contacto_id = 1
                GROUP BY c.NIF, c.Nome, c.cp, email.numero_c;";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlDataAdapter adapter = new SqlDataAdapter(query, connection);
                    System.Data.DataTable dataTable = new System.Data.DataTable();
                    adapter.Fill(dataTable);

                    dataGridView1.DataSource = dataTable;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao carregar dados: " + ex.Message);
            }
        }

        private void btnAbrirInserir_Click(object sender, EventArgs e)
        {
            FormInserir formInserir = new FormInserir();
            formInserir.ShowDialog();
            AtualizarDados();
        }

        private void btnEliminar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                string nif = dataGridView1.SelectedRows[0].Cells["NIF"].Value.ToString();
                string connectionString = "Server=DESKTOP-D6VVOOR;Database=P01-SAD;Trusted_Connection=True;";

                try
                {
                    using (SqlConnection connection = new SqlConnection(connectionString))
                    {
                        connection.Open();

                        string deleteContactosQuery = "DELETE FROM contacto WHERE NIF = @NIF";
                        SqlCommand deleteContactosCmd = new SqlCommand(deleteContactosQuery, connection);
                        deleteContactosCmd.Parameters.AddWithValue("@NIF", nif);
                        deleteContactosCmd.ExecuteNonQuery();

                        string deleteClienteQuery = "DELETE FROM cliente WHERE NIF = @NIF";
                        SqlCommand deleteClienteCmd = new SqlCommand(deleteClienteQuery, connection);
                        deleteClienteCmd.Parameters.AddWithValue("@NIF", nif);
                        deleteClienteCmd.ExecuteNonQuery();

                        MessageBox.Show("Cliente e contactos eliminados com sucesso!");
                        AtualizarDados();
                    }
                }
                catch (Exception ex)
                {
                    MessageBox.Show("Erro ao eliminar cliente: " + ex.Message);
                }
            }
            else
            {
                MessageBox.Show("Por favor, selecione um cliente para eliminar.");
            }
        }

        private void btnEditar_Click(object sender, EventArgs e)
        {
            if (dataGridView1.SelectedRows.Count > 0)
            {
                string nif = dataGridView1.SelectedRows[0].Cells["NIF"].Value.ToString();
                FormEditar formEditar = new FormEditar(nif);
                formEditar.ShowDialog();
                AtualizarDados();
            }
            else
            {
                MessageBox.Show("Por favor, selecione um cliente para editar.");
            }
        }

        private void btnPesquisar_Click(object sender, EventArgs e)
        {
            string nif = txtNIFPesquisar.Text.Trim();
            if (string.IsNullOrEmpty(nif))
            {
                MessageBox.Show("Por favor, insira um NIF para pesquisar.", "Erro");
                return;
            }

            PesquisarCliente(nif);
        }

        private void PesquisarCliente(string nif)
        {
            string connectionString = "Server=DESKTOP-D6VVOOR;Database=P01-SAD;Trusted_Connection=True;";

            try
            {
                using (SqlConnection connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    SqlCommand cmd = new SqlCommand("PesquisarCliente", connection);
                    cmd.CommandType = CommandType.StoredProcedure;
                    cmd.Parameters.AddWithValue("@NIF", nif);

                    SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                    System.Data.DataTable dataTable = new System.Data.DataTable();
                    adapter.Fill(dataTable);

                    if (dataTable.Rows.Count > 0)
                    {
                        DataRow row = dataTable.Rows[0];
                        string detalhes = $"NIF: {row["NIF"]}\n" +
                                          $"Nome: {row["NomeCliente"]}\n" +
                                          $"Código Postal: {row["CodigoPostal"]}\n" +
                                          $"Email: {row["Email"]}\n" +
                                          $"Telefones: {row["Telefones"]}\n" +
                                          $"Matrículas: {row["Matriculas"]}";
                        MessageBox.Show(detalhes, "Detalhes do Cliente");
                    }
                    else
                    {
                        MessageBox.Show("Cliente não encontrado.", "Erro");
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show("Erro ao pesquisar cliente: " + ex.Message);
            }
        }
    }
}