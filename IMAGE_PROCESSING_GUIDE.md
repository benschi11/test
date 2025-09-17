# Anleitung zur Bildverarbeitung

## Übersicht
Diese Datei erklärt, wie das Referenzbild in einzelne Komponenten aufgeteilt und in die HTML-Datei integriert wird.

## Schritte

### 1. Bild ausschneiden
- Das Referenzbild mit einem Bildbearbeitungsprogramm (z.B. GIMP, Photoshop, oder Online-Tools) öffnen
- Einzelne Bereiche des Bildes auswählen und als separate Dateien speichern
- Empfohlene Dateiformate: WebP (beste Kompression) oder JPG (gute Kompatibilität)

### 2. Bild-Optimierung
- Bilder für Web optimieren (Dateigröße reduzieren)
- Responsive Bildgrößen erstellen (verschiedene Auflösungen für verschiedene Bildschirmgrößen)
- Empfohlene Tools: 
  - Online: TinyPNG, ImageOptim
  - CLI: imagemagick, squoosh-cli

### 3. Integration in HTML

#### Vorher (Platzhalter):
```html
<div class="image-placeholder">
    <div class="text-center">
        <strong>Hauptbild</strong><br>
        <small>Ausgeschnitten aus dem Gesamtbild</small>
    </div>
</div>
```

#### Nachher (echtes Bild):
```html
<img src="images/hauptbild.webp" 
     alt="Hauptbild Beschreibung" 
     class="img-fluid"
     loading="lazy">
```

### 4. Ordnerstruktur
```
/
├── index.html
├── images/
│   ├── hauptbild.webp
│   ├── teilbild-2.webp
│   ├── teilbild-3.webp
│   └── ...
└── css/ (optional für eigene Styles)
```

### 5. Responsive Verhalten
Die Bootstrap-Klassen sorgen für automatische Anpassung:
- `col-12 col-lg-6`: Vollbreite auf Mobile, halbe Breite auf Desktop
- `col-6`: Halbe Breite
- `col-12 col-md-4`: Vollbreite auf Mobile, Drittel-Breite auf Desktop
- `img-fluid`: Bilder passen sich automatisch der Container-Breite an

## Beispiel-Code für Bildersetzung

```html
<!-- Ersetze die image-placeholder Divs mit: -->
<img src="images/bild1.webp" 
     alt="Beschreibung des Bildes" 
     class="img-fluid rounded shadow-sm"
     loading="lazy">
```

## Browser-Test
Teste die Seite in verschiedenen Bildschirmgrößen:
- Mobile (< 576px)
- Tablet (768px - 992px)  
- Desktop (> 1200px)