part of stagexl_richtextfield;

final Map<String, _RichFontStyleMetrics> _fontStyleMetrics = new Map<String, _RichFontStyleMetrics>();

_RichFontStyleMetrics _getFontStyleMetrics(String fontStyle) {

  if (_fontStyleMetrics.containsKey(fontStyle) == false) {
    _fontStyleMetrics[fontStyle] = new _RichFontStyleMetrics(fontStyle);
  }

  return _fontStyleMetrics[fontStyle]!;
}

//-------------------------------------------------------------------------------------------------

class _RichFontStyleMetrics {

  String fontStyle;
  int ascent = 0;
  int descent = 0;
  int height = 0;

  _RichFontStyleMetrics(this.fontStyle) {

    this.fontStyle = fontStyle;

    var text = html.HTMLSpanElement();
    text.style.font = this.fontStyle;
    text.text = "Hg";

    var block = html.HTMLDivElement();
    block.style.display = "inline-block";
    block.style.width = "1px";
    block.style.height = "0px";

    var div = html.HTMLDivElement();
    div.append(block);
    div.append(text);

    html.document.body!.append(div);

    try {
      block.style.verticalAlign = "baseline";
      this.ascent = block.offsetTop - text.offsetTop;

      block.style.verticalAlign = "bottom";
      this.height = block.offsetTop - text.offsetTop;

      this.descent = height - ascent;

    } catch (e) {
      // ignore error
    } finally {
      div.remove();
    }
  }
}

