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
    public partial class Hosp_Services : Form
    {
		Controller controllerObj;
        public Hosp_Services()
        {
            InitializeComponent();
        }

		private void Hosp_Services_Load(object sender, EventArgs e)
		{
			controllerObj = new Controller();
		}

		private void button1_Click(object sender, EventArgs e)
		{
			DataTable dt = controllerObj.SelectAllServices();
			dataGridView1.DataSource = dt;
			dataGridView1.Refresh();
		}

        private void button2_Click(object sender, EventArgs e)
        {
			int r = controllerObj.InsertOfferedBy(textBox1.Text, comboBox1.Text);
            if (r == 0)
                MessageBox.Show("Service failed to link");
            else
                MessageBox.Show("Service Link to hospital");
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            DataTable dt = controllerObj.SelectPatientRequest();
            dataGridView1.DataSource = dt;
            dataGridView1.Refresh();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int r = controllerObj.DeleteRequest(textBox2.Text);
            if (r == 0)
                MessageBox.Show("Request Not Accepted");
            else
                MessageBox.Show("Request Accepted");
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }
    }
}
