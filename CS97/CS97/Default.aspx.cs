using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace CS97
{
    public partial class _Default : Page
    {
        SqlConnection X;
        SqlCommand C;
        SqlDataReader R;
        String S;
        protected void OpebData(Label L, SqlConnection S)
        {
            if (S.State == System.Data.ConnectionState.Closed)
            {
                try
                { S.Open(); L.Text = "連接成功!"; }
                catch (Exception)
                { L.Text = "連通失敗"; }
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            X = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\liu\documents\visual studio 2015\Projects\CS97\CS97\App_Data\Student.mdf;Integrated Security=True");
            OpebData(Label1, X);
            S="select 學系,姓名 from Dept where (學號 IN('50031','50102')) order by 學系";
            Label1.Text = "SQL語言=" + S;
            C = new SqlCommand(S, X);
            C.ExecuteNonQuery();
            R = C.ExecuteReader();
            TextBox1.Text = "以下學生修課";
            TextBox1.Text = TextBox1.Text + "\r\n" +"學系 姓名";
            while (R.Read() == true)
            {
                TextBox1.Text = TextBox1.Text+"\r\n"+R["學系"]+R["姓名"];
            }
            X.Close();
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            X = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\liu\documents\visual studio 2015\Projects\CS97\CS97\App_Data\Student.mdf;Integrated Security=True");
            OpebData(Label1, X);
            S = "select 姓名,學系,成績 from Score INNER JOIN Dept ON Score.學號=Dept.學號 where 1=1";
            Label1.Text = "SQL語言=" + S;
            C = new SqlCommand(S, X);
            C.ExecuteNonQuery();
            R = C.ExecuteReader();
            TextBox1.Text = "姓名 學系 成績";
            int n = 0;
            int Total = 0, Avg = 0;
            while (R.Read() == true)
            {
                TextBox1.Text = TextBox1.Text + "\r\n" + R["姓名"] +""+R["學系"]+ R["成績"];
                n = n + 1;
                Total = Total + Convert.ToInt16(R["成績"]);
            }
            Avg = Total / n;
            TextBox1.Text = TextBox1.Text + "\r\n" + "平均" + Convert.ToString(Avg);
            TextBox1.Text = TextBox1.Text + "\r\n" + "共" + n + "名同學";
            X.Close();
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            X = new SqlConnection(@"Data Source=(LocalDB)\MSSQLLocalDB;AttachDbFilename=c:\users\liu\documents\visual studio 2015\Projects\CS97\CS97\App_Data\Student.mdf;Integrated Security=True");
            OpebData(Label1, X);
            S = "select 學號 from Score where 學號 Between '50100' AND '50200' union Select 學號 from Dept where 學號 Between '50100' AND '50200'";
            Label1.Text = "SQL語言=" + S;
            C = new SqlCommand(S, X);
            C.ExecuteNonQuery();
            R = C.ExecuteReader();
            TextBox1.Text = "以下是兩資料表合併後的學號";
            while (R.Read() == true)
            {
                TextBox1.Text = TextBox1.Text + "\r\n" + R["學號"];
            }
            X.Close();
        }
    }
}