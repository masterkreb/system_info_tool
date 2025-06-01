# System Info Tool
# Gruppenmitglieder: Mathias, Imad, Abdelhadi
#
#-----------------------------------------------------------
# Mathias: GUI-Grundgerüst und grundlegende Systeminformationen
#-----------------------------------------------------------
#
# Laden der benötigten Assemblies für GUI
Add-Type -AssemblyName System.Windows.Forms             # Ermöglicht die Erstellung von Windows Forms
Add-Type -AssemblyName System.Drawing                   # Ermöglicht das Zeichnen von UI-Elementen

# Erstellung des Hauptformulars
$form = New-Object System.Windows.Forms.Form            # Erstellt das Hauptfenster der Anwendung
$form.Text = "System Info"                              # Titel des Fensters
$form.Size = New-Object System.Drawing.Size(650, 550)   # Setzt die Fenstergrösse in Pixeln (Breite x Höhe)
$form.StartPosition = "CenterScreen"                    # Zentriert das Fenster beim Start

# Erstellen und Hinzufügen der Label und Textfelder

# Label für das Betriebssystem
$labelOS = New-Object System.Windows.Forms.Label              # Erstellt ein Label zur Anzeige von Text
$labelOS.Location = New-Object System.Drawing.Point(10, 10)   # Setzt die Position des Labels (10 Pixel vom linken Rand und 10 Pixel vom oberen Formularrand entfernt)
$labelOS.Text = "Betriebssystem:"                             # Setzt den Text des Labels
$form.Controls.Add($labelOS)                                  # Fügt das Label dem Formular hinzu

# Textfeld für das Betriebssystem
$textBoxOS = New-Object System.Windows.Forms.TextBox            # Erstellt ein Textfeld
$textBoxOS.Location = New-Object System.Drawing.Point(150, 10)  # Position des Textfelds      (150 Pixel vom linken Rand und 10 Pixel vom oberen Formularrand entfernt)
$textBoxOS.Size = New-Object System.Drawing.Size(380, 20)       # Breite und Höhe des Textfelds in Pixeln
$textBoxOS.ReadOnly = $true                                     # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxOS)                                  # Fügt das Textfeld dem Formular hinzu

# Label für den Computernamen  
$labelComputerName = New-Object System.Windows.Forms.Label             # Erstellt ein weiteres Label
$labelComputerName.Location = New-Object System.Drawing.Point(10, 40)  # Position des Labels   (10 Pixel vom linken Rand und 40 Pixel vom oberen Formularrand entfernt)
$labelComputerName.Text = "Computername:"                              # Setzt den Text für das Label
$form.Controls.Add($labelComputerName)                                 # Fügt das Label dem Formular hinzu

# Textfeld für den Computernamen
$textBoxComputerName = New-Object System.Windows.Forms.TextBox             # Erstellt ein Textfeld für den Computernamen
$textBoxComputerName.Location = New-Object System.Drawing.Point(150, 40)   # Setzt die Position (150 Pixel vom linken Rand und 40 Pixel vom oberen Formularrand entfernt)
$textBoxComputerName.Size = New-Object System.Drawing.Size(380, 20)        # Breite und Höhe des Textfelds in Pixeln
$textBoxComputerName.ReadOnly = $true                                      # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxComputerName)                                   # Fügt das Textfeld dem Formular hinzu

# Label für den Benutzernamen 
$labelUserName = New-Object System.Windows.Forms.Label               # Erstellt ein Label für den Benutzernamen
$labelUserName.Location = New-Object System.Drawing.Point(10, 70)    # Position des Labels      (10 Pixel vom linken Rand und 70 Pixel vom oberen Formularrand entfernt)
$labelUserName.Text = "Benutzername:"                                # Setzt den Text für das Label  
$form.Controls.Add($labelUserName)                                   # Fügt das Label dem Formular hinzu

# Textfeld für den Benutzernamen
$textBoxUserName = New-Object System.Windows.Forms.TextBox           # Erstellt ein Textfeld für den Benutzernamen
$textBoxUserName.Location = New-Object System.Drawing.Point(150, 70) # Setzt die Position       (150 Pixel vom linken Rand und 70 Pixel vom oberen Formularrand entfernt)
$textBoxUserName.Size = New-Object System.Drawing.Size(380, 20)      # Breite und Höhe des Textfelds in Pixeln
$textBoxUserName.ReadOnly = $true                                    # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxUserName)

# Label für die CPU 
$labelCPU = New-Object System.Windows.Forms.Label               # Erstellt ein Label für die CPU
$labelCPU.Location = New-Object System.Drawing.Point(10, 100)   # Setzt die Position            (10 Pixel vom linken Rand und 100 Pixel vom oberen Formularrand entfernt)
$labelCPU.Text = "CPU:"                                         # Beschriftung des Labels
$form.Controls.Add($labelCPU)                                   # Fügt das Label zum Formular hinzu

# Textfeld für die CPU
$textBoxCPU = New-Object System.Windows.Forms.TextBox            # Erstellt ein Textfeld für die CPU
$textBoxCPU.Location = New-Object System.Drawing.Point(150, 100) # Positioniert das Textfeld    (150 Pixel vom linken Rand und 100 Pixel vom oberen Formularrand entfernt)
$textBoxCPU.Size = New-Object System.Drawing.Size(380, 20)       # Breite und Höhe des Textfelds in Pixeln
$textBoxCPU.ReadOnly = $true                                     # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxCPU)                                  # Fügt das Textfeld zum Formular hinzu



# Abrufen und Anzeigen von grundlegender Systeminformationen und CPU

# Betriebssystem und Version
$os = Get-WmiObject Win32_OperatingSystem          # Holt die Betriebssysteminformationen
$textBoxOS.Text = "$($os.Caption) $($os.Version)"  # Zeigt Name und Version des Betriebssystems an
$textBoxComputerName.Text = $env:COMPUTERNAME      # Zeigt den Computernamen an
$textBoxUserName.Text = $env:USERNAME              # Zeigt den Benutzernamen an

# CPU-Informationen
$cpu = Get-WmiObject Win32_Processor               # Holt die CPU-Informationen
$textBoxCPU.Text = $cpu.Name                       # Zeigt den Namen der CPU an


#-----------------------------------------------------------
# Imad: Hardwareinformationen
#-----------------------------------------------------------

# Label für den RAM
$labelRAM = New-Object System.Windows.Forms.Label               # Erstellt ein Label für die RAM-Anzeige
$labelRAM.Location = New-Object System.Drawing.Point(10, 130)   # Setzt die Position des Labels  (10 Pixel vom linken Rand und 130 Pixel vom oberen Formularrand entfernt)
$labelRAM.Text = "RAM:"                                         # Beschriftung des Labels
$form.Controls.Add($labelRAM)                                   # Fügt das Label zum Formular hinzu

# Textfeld für den RAM
$textBoxRAM = New-Object System.Windows.Forms.TextBox            # Erstellt ein Textfeld zur Anzeige des RAMs
$textBoxRAM.Location = New-Object System.Drawing.Point(150, 130) # Positioniert das Textfeld     (150 Pixel vom linken Rand und 130 Pixel vom oberen Formularrand entfernt)
$textBoxRAM.Size = New-Object System.Drawing.Size(380, 20)       # Breite und Höhe des Textfelds in Pixeln
$textBoxRAM.ReadOnly = $true                                     # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxRAM)                                  # Fügt das Textfeld zum Formular hinzu

# Label für Festplatten/SSDs
$labelDisks = New-Object System.Windows.Forms.Label              # Erstellt ein Label für die Anzeige von Festplatten
$labelDisks.Location = New-Object System.Drawing.Point(10, 160)  # Setzt die Position            (10 Pixel vom linken Rand und 160 Pixel vom oberen Formularrand entfernt)
$labelDisks.Text = "Festplatten/SSDs:"                           # Beschriftung des Labels
$form.Controls.Add($labelDisks)                                  # Fügt das Label zum Formular hinzu

# Textfeld für Festplatten/SSDs
$textBoxDisks = New-Object System.Windows.Forms.TextBox             # Erstellt ein mehrzeiliges Textfeld
$textBoxDisks.Location = New-Object System.Drawing.Point(150, 160)  # Positioniert das Textfeld  (150 Pixel vom linken Rand und 160 Pixel vom oberen Formularrand entfernt)
$textBoxDisks.Size = New-Object System.Drawing.Size(380, 60)        # Breite und Höhe des Textfelds in Pixeln
$textBoxDisks.Multiline = $true                                     # Ermöglicht mehrere Zeilen
$textBoxDisks.ScrollBars = "Vertical"                               # Fügt eine vertikale Scrollbar hinzu
$textBoxDisks.ReadOnly = $true                                      # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxDisks)                                   # Fügt das Textfeld zum Formular hinzu

# Label für die Grafikkarte
$labelGPU = New-Object System.Windows.Forms.Label              # Erstellt ein Label für die GPU-Anzeige
$labelGPU.Location = New-Object System.Drawing.Point(10, 230)  # Setzt die Position              (10 Pixel vom linken Rand und 230 Pixel vom oberen Formularrand entfernt)
$labelGPU.Text = "Grafikkarte:"                                # Beschriftung des Labels
$form.Controls.Add($labelGPU)                                  # Fügt das Label zum Formular hinzu

# Textfeld für die Grafikkarte
$textBoxGPU = New-Object System.Windows.Forms.TextBox              # Erstellt ein Textfeld für die GPU
$textBoxGPU.Location = New-Object System.Drawing.Point(150, 230)   # Positioniert das Textfeld   (150 Pixel vom linken Rand und 230 Pixel vom oberen Formularrand entfernt)
$textBoxGPU.Size = New-Object System.Drawing.Size(380, 20)         # Breite und Höhe des Textfelds in Pixeln
$textBoxGPU.ReadOnly = $true                                       # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxGPU)                                    # Fügt das Textfeld zum Formular hinzu

# Label für das Motherboard 
$labelMotherboard = New-Object System.Windows.Forms.Label               # Erstellt ein Label für das Motherboard
$labelMotherboard.Location = New-Object System.Drawing.Point(10, 260)   # Setzt die Position     (10 Pixel vom linken Rand und 260 Pixel vom oberen Formularrand entfernt)
$labelMotherboard.Text = "Motherboard:"                                 # Beschriftung des Labels
$form.Controls.Add($labelMotherboard)                                   # Fügt das Label zum Formular hinzu

# Textfeld für das Motherboard
$textBoxMotherboard = New-Object System.Windows.Forms.TextBox             # Erstellt ein Textfeld für das Motherboard
$textBoxMotherboard.Location = New-Object System.Drawing.Point(150, 260)  # Positioniert das Textfeld  (150 Pixel vom linken Rand und 260 Pixel vom oberen Formularrand entfernt)
$textBoxMotherboard.Size = New-Object System.Drawing.Size(380, 20)        # Breite und Höhe des Textfelds in Pixeln
$textBoxMotherboard.ReadOnly = $true                                      # Setzt das Textfeld auf nur-lesbar
$form.Controls.Add($textBoxMotherboard)                                   # Fügt das Textfeld zum Formular hinzu

# Abrufen und Anzeigen von Grafikkarte, Motherboard, RAM und Festplatten

# Grafikkarteninformation
$gpu = Get-WmiObject Win32_VideoController  # Holt die Informationen zur Grafikkarte
$textBoxGPU.Text = $gpu.Name                # Zeigt den Namen der Grafikkarte an

# Motherboard-Informationen
$motherboard = Get-WmiObject Win32_BaseBoard                                        # Holt die Informationen zum Motherboard
$textBoxMotherboard.Text = "$($motherboard.Manufacturer) $($motherboard.Product)"   # Zeigt Hersteller und Modell des Motherboards an

# RAM-Informationen
$ram = Get-WmiObject Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum # Holt die Gesamtgrösse des RAMs
$textBoxRAM.Text = "$($ram.Sum / 1GB) GB"                                          # Zeigt die RAM-Grösse in GB an

# Festplatteninformationen
$disks = Get-WmiObject Win32_DiskDrive                                               # Holt die Informationen über die Festplatten
$diskInfo = foreach ($disk in $disks) { "$($disk.Model) ($($disk.Size / 1GB) GB)" }  # Erstellt eine Liste der Festplatten
$textBoxDisks.Text = $diskInfo -join "`r`n"                                          # Zeigt die Festplatteninformationen im Textfeld an


#-----------------------------------------------------------
# Abdelhadi: Exportfunktion
#-----------------------------------------------------------

# Exportfunktion

# Erstellt einen Button für den Export der Systeminformationen
$btnExport = New-Object System.Windows.Forms.Button  # Erstellt den Button-Objekt
$btnExport.Location = New-Object System.Drawing.Point(150, 300)  # Positioniert den Button auf dem Fenster (150 Pixel vom linken Rand und 300 Pixel vom oberen Formularrand entfernt)
$btnExport.Size = New-Object System.Drawing.Size(120, 30)  # Setzt die Breite und Höhe des Buttons
$btnExport.Text = "Exportieren"  # Beschriftung des Buttons

# Fügt eine Klick-Aktion zum Button hinzu
$btnExport.Add_Click({
    try {
        # Erstellt ein Dialogfenster für das Speichern der Datei
        $saveDialog = New-Object System.Windows.Forms.SaveFileDialog
        $saveDialog.Filter = "Textdateien (*.txt)|*.txt|Alle Dateien (*.*)|*.*"  # Erlaubt nur .txt-Dateien
        $saveDialog.DefaultExt = "txt"  # Standard-Dateiendung ist .txt
        $saveDialog.AddExtension = $true  # Falls keine Dateiendung eingegeben wird, wird .txt hinzugefügt
        $saveDialog.Title = "Systeminformationen speichern"  # Titel des Speichern-Dialogs
        $saveDialog.FileName = "PC-Info-$env:COMPUTERNAME-$(Get-Date -Format 'yyyy-MM-dd').txt"  # Standard-Dateiname mit Computername + Datum

        # Prüft, ob der Benutzer einen Speicherort ausgewählt hat
        if ($saveDialog.ShowDialog() -eq [System.Windows.Forms.DialogResult]::OK) {
            
            # Erstellt den Exporttext mit den aktuellen Systeminformationen
            # Das @" ... "@ ermöglicht mehrzeilige Strings (Multiline-Strings)            
            $exportText = @"
PC-Systeminformationen
Erstellt am: $(Get-Date) 
----------------------------------------

Betriebssystem: $($textBoxOS.Text)
Computername: $($textBoxComputerName.Text)
Benutzername: $($textBoxUserName.Text)

Hardware:
- CPU: $($textBoxCPU.Text)
- RAM: $($textBoxRAM.Text)
- Grafikkarte: $($textBoxGPU.Text)
- Motherboard: $($textBoxMotherboard.Text)

Festplatten/SSDs:
$($textBoxDisks.Text)
"@
            
            # Speichert die Informationen in der ausgewählten Datei
            $exportText | Out-File -FilePath $saveDialog.FileName -Encoding utf8
            
            # Zeigt eine Erfolgsmeldung nach erfolgreichem Speichern an
            [System.Windows.Forms.MessageBox]::Show(
                "Die Systeminformationen wurden erfolgreich exportiert nach:`n$($saveDialog.FileName)", 
                "Export erfolgreich",
                [System.Windows.Forms.MessageBoxButtons]::OK,
                [System.Windows.Forms.MessageBoxIcon]::Information)
        }
    }
    catch {
        # Falls ein Fehler auftritt, wird eine Fehlermeldung angezeigt
        [System.Windows.Forms.MessageBox]::Show(
            "Fehler beim Exportieren: $($_.Exception.Message)", 
            "Fehler",
            [System.Windows.Forms.MessageBoxButtons]::OK,
            [System.Windows.Forms.MessageBoxIcon]::Error)
    }
})

# Fügt den Export-Button zum Hauptfenster hinzu
$form.Controls.Add($btnExport)

# Anzeigen des Hauptfensters
$form.Add_Shown({$form.Activate()})  # Aktiviert das Formular beim Start
[void]$form.ShowDialog()  # Zeigt das Fenster an und hält es geöffnet




