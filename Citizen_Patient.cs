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
    public partial class Citizen_Patient : Form
    {
        Controller objcontroller;
        public Citizen_Patient()
        {
            InitializeComponent();
            objcontroller = new Controller();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
                int r = objcontroller.InsertPatient(textBox121.Text, comboBox2.Text, comboBox1.Text, checkBox1.Checked);
                if (r == 0)
                    MessageBox.Show("Insertion of patient failed");
                else
                    MessageBox.Show("Patient Added Succesfully");
        }

		private void Citizen_Patient_Load(object sender, EventArgs e)
		{

		}
	}
}
