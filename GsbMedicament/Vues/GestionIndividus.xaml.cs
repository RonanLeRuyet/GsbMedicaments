using GestionnaireBdd;
using ProjetGsb;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;

namespace GsbMedicament.Vues
{
    /// <summary>
    /// Logique d'interaction pour GestionIndividus.xaml
    /// </summary>
    public partial class GestionIndividus : Window
    {
        public GestionIndividus()
        {
            InitializeComponent();
        }

        GstBdd gst;

        //Générer la liste des individus
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            gst = new GstBdd();
            lstTotalTypeIndividu.ItemsSource = gst.getAllIndividu();
        }

        //Bouton de modification des individus
        private void btnModifierIndividu_Click(object sender, RoutedEventArgs e)
        {
            //S'assurer que les champs recquis sont valables
            if (TxtTypeIndividu.Text == null)
            {
                MessageBox.Show("Vous devez entrer un individu.", "Erreur de saisie", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                int codeTypeIndividu = (lstTotalTypeIndividu.SelectedItem as TypeIndividu).CodeTypeIndividu;
                string libelleTypeIndividu = TxtTypeIndividu.Text;
                gst.UpdateIndividu(codeTypeIndividu, libelleTypeIndividu);
                lstTotalTypeIndividu.ItemsSource = gst.getAllIndividu();

                MessageBox.Show("Ce type d'individu à été mis à jour.");
            }
        }

        //Bouton d'ahout d'un type d'individu
        private void btnAjouterIndividu_Click(object sender, RoutedEventArgs e)
        {
            if (TxtTypeIndividu.Text == null)
            {
                MessageBox.Show("Veuillez entrer un type d'individu", "Erreur de sélection", MessageBoxButton.OK, MessageBoxImage.Error);
            }
            else
            {
                gst.Ajouterindividu(Convert.ToInt16(gst.getLastCodeIndividu()), TxtTypeIndividu.Text);
                lstTotalTypeIndividu.ItemsSource = gst.getAllIndividu();

                MessageBox.Show("Ce type d'individu à été ajouter.");
            }
        }

        private void lstTotalTypeIndividu_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {

        }        
    }
}