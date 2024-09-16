using Android.Views;
using Newtonsoft.Json;

namespace DiarioAndroid
{
    [Activity(Label = "@string/app_name", MainLauncher = true)]
    public class MainActivity : Activity
    {
        private TextView? textViewScrollable;
        private DatePicker? datePicker;
        private Button? button;
        private EditText? inputText;

        private List<string[]> matrix;
        protected override void OnCreate(Bundle? savedInstanceState)
        {
            base.OnCreate(savedInstanceState);

            Window.SetSoftInputMode(SoftInput.AdjustResize); // You can use AdjustNothing, AdjustPan, AdjustResize, etc.

            SetContentView(Resource.Layout.activity_main);

            textViewScrollable = FindViewById<TextView>(Resource.Id.textViewScrollable);
            datePicker = FindViewById<DatePicker>(Resource.Id.datePicker);
            button = FindViewById<Button>(Resource.Id.button);
            inputText = FindViewById<EditText>(Resource.Id.inputText);

            LoadMatrixFromFile();
            datePicker.DateChanged += DatePicker_DateChanged;
            UpdateTextView();
            if (button != null)
            {
                button.Click += (sender, e) =>
                {
                    string datanow = $"{datePicker.DayOfMonth}/{datePicker.Month + 1}/{datePicker.Year}";
                    bool updated = false;

                    if (inputText != null && inputText.Text.Contains(';'))
                    {
                        Toast.MakeText(this, "L'input non può contenere il carattere ';'", ToastLength.Long).Show();
                        return;
                    }

                    for (int i = 0; i < matrix.Count; i++)
                    {
                        if (datanow == matrix[i][0])
                        {
                            if (!string.IsNullOrWhiteSpace(inputText.Text))
                            {
                                matrix[i][1] += ";" + inputText.Text;
                                updated = true;
                            }
                            break;
                        }
                    }

                    if (!updated)
                    {
                        if (!string.IsNullOrWhiteSpace(inputText.Text))
                        {
                            matrix.Add(new[] { datanow, inputText.Text });
                            updated = true;
                        }
                    }

                    if (updated)
                    {
                        inputText.Text = "";
                        UpdateTextView();
                        SaveMatrixToFile();
                    }
                };
            }

        }
        private void DatePicker_DateChanged(object sender, DatePicker.DateChangedEventArgs e)
        {
            UpdateTextView();
        }

        private void UpdateTextView()
        {
            textViewScrollable.Text = "";
            string datanow = $"{datePicker.DayOfMonth}/{datePicker.Month + 1}/{datePicker.Year}";
            bool esiste = false;
            for (int i = 0; i < matrix.Count; i++)
            {
                if (datanow == matrix[i][0])
                {
                    string[] parts = matrix[i][1].Split(';');
                    textViewScrollable.Text = string.Join("\n", parts);
                    esiste = true;
                    return;
                }
            }
            if (!esiste)
            {
                textViewScrollable.Text = "Nessun Impegno";
            }
        }


        private void SaveMatrixToFile()
        {
            var fileName = "matrixData.json";
            var folderPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            var filePath = Path.Combine(folderPath, fileName);

            if (!Directory.Exists(folderPath))
            {
                Directory.CreateDirectory(folderPath);
            }

            var json = JsonConvert.SerializeObject(matrix);
            File.WriteAllText(filePath, json);
        }

        private void LoadMatrixFromFile()
        {
            var fileName = "matrixData.json";
            var folderPath = System.Environment.GetFolderPath(System.Environment.SpecialFolder.Personal);
            var filePath = Path.Combine(folderPath, fileName);

            matrix = new List<string[]>();

            if (File.Exists(filePath))
            {
                var json = File.ReadAllText(filePath);
                matrix = JsonConvert.DeserializeObject<List<string[]>>(json) ?? new List<string[]>();
            }
        }

    }
}