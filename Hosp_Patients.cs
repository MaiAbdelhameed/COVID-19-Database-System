using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Windows.Forms;

namespace DBapplication
{
    public partial class Hosp_Patients : Form
    {
        Controller controllerObj;
        public Hosp_Patients()
        {
            InitializeComponent();
        }

		private void Hosp_Patients_Load(object sender, EventArgs e)
		{
            controllerObj = new Controller();
        }

		private void button1_Click(object sender, EventArgs e)
		{
            DataTable dt = controllerObj.SelectAllPatients();
            dataGridView1.DataSource = dt;
            dataGridView1.Refresh();
        }

		private void label2_Click(object sender, EventArgs e)
		{

		}

		private void button3_Click(object sender, EventArgs e)
		{

		}

		private void button2_Click(object sender, EventArgs e)
		{
			
		}

		private void button4_Click(object sender, EventArgs e)
		{
			if (textBoxx1.Text == "")
				MessageBox.Show("Please enter National ID to delete the patient.");
			else
			{
				int result = controllerObj.DeletePatient(textBoxx1.Text.ToString());
				if (result==0)
					MessageBox.Show("Failed to delete patient.");
				else
					MessageBox.Show("Patient deleted successfully.");

			}
		}

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void label3_Click(object sender, EventArgs e)
        {

        }

        private void textBox3_TextChanged(object sender, EventArgs e)
        {

        }

        private void textBox5_TextChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
			DataTable dt = controllerObj.SelectACitizen(textBox5.Text);
			dataGridView2.DataSource = dt;
			dataGridView2.Refresh();
			

		}

        private void button3_Click_1(object sender, EventArgs e)
        {
			controllerObj.UpdateAvailability(checkBox1.Checked);
        }
    }
}
