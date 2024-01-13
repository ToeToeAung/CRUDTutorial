using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Configuration;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using CRUD.BLL;
using CRUD.Entities;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace CRUDTutorial
{
    public partial class Form1 : Form
    {
        string connectionString = System.Configuration.ConfigurationManager.ConnectionStrings["crudConnectionStr"].ConnectionString;
        CRUDBLL cRUDBLL = new CRUDBLL();
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {

            dataGridView1.DataSource = cRUDBLL.getStudent(connectionString);
        }

        private void btnSave_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student = bindStudent();
            cRUDBLL.insertStudent(connectionString, student);
            dataGridView1.DataSource = cRUDBLL.getStudent(connectionString);
        }

        private Student bindStudent()
        {
            Student student = new Student();
            student.ID = Convert.ToInt32(lblID.Text);
            student.Name = txtName.Text;
            student.Email = txtEmail.Text;
            student.Phone = txtPhone.Text;
            student.Address = txtAddress.Text;
            return student;
        }

        private void dataGridView1_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            if (e.RowIndex >= 0 && e.ColumnIndex >= 0)
            {

                int selectedRowIndex = e.RowIndex;
                int id = (int)dataGridView1.Rows[selectedRowIndex].Cells["ID"].Value;
                string name = dataGridView1.Rows[selectedRowIndex].Cells["Name"].Value.ToString();
                string email = dataGridView1.Rows[selectedRowIndex].Cells["Email"].Value.ToString();
                string phone = dataGridView1.Rows[selectedRowIndex].Cells["Phone"].Value.ToString();
                string add = dataGridView1.Rows[selectedRowIndex].Cells["Address"].Value.ToString();

                lblID.Text = id.ToString();
                txtName.Text = name;
                txtEmail.Text = email;
                txtPhone.Text = phone;
                txtAddress.Text = add;


                //MessageBox.Show($"Cell Double-Clicked!\nRow: {e.RowIndex + 1}\nColumn: {e.ColumnIndex + 1}\nValue: {cellValue}");
            }
        }

        private void btnUpdate_Click(object sender, EventArgs e)
        {
            Student student = new Student();
            student = bindStudent();
            cRUDBLL.updateStudent(connectionString, student);
            dataGridView1.DataSource = cRUDBLL.getStudent(connectionString);
        }

        private void btnDelete_Click(object sender, EventArgs e)
        {
            int ID= Convert.ToInt32(lblID.Text);
            if(ID>0) {
                cRUDBLL.deleteStudent(connectionString, ID);
                dataGridView1.DataSource = cRUDBLL.getStudent(connectionString);
            }           
        }
    }
}
