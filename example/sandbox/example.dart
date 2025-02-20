import 'package:web/web.dart'
  show HTMLCanvasElement, document, HTMLTextAreaElement, HTMLButtonElement, ElementEventGetters;
import 'package:stagexl/stagexl.dart';
import 'package:stagexl_richtextfield/stagexl_richtextfield.dart';

void main() {

  final canvas = document.getElementById("richtext")! as HTMLCanvasElement;
  final textarea = document.getElementById('texttodraw')! as HTMLTextAreaElement;
  final reload = document.getElementById('reload')! as HTMLButtonElement;

  Stage stage = Stage(canvas);
  RenderLoop render = RenderLoop();

  RichTextFormat format = RichTextFormat(
      'Calibri, sans-serif', 25, 0x000000, align: TextFormatAlign.LEFT);

  RichTextFormat excited = format.clone()
    ..bold = true
    ..italic = true
    ..size = 30
    ..color = 0xFF00FF;

  RichTextField rtf = RichTextField('', format)
    ..presets['excited'] = excited
    ..text = textarea.value
    ..width = stage.sourceWidth
    ..height = stage.sourceHeight
    ..wordWrap = true;

  render.addStage(stage);
  stage.addChild(rtf);

  reload.onClick.listen((e) {
    rtf.text = textarea.value;
  });

}
