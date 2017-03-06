package org.mokylin.skin.app.beibao
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Slider;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_jia;
	import org.mokylin.skin.component.button.ButtonSkin_jian;
	import org.mokylin.skin.component.button.ButtonSkin_putong;
	import org.mokylin.skin.component.slider.skin_Slider;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class wupingchaifen extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var btnClose:feathers.controls.Button;

		public var btn_cancel:feathers.controls.Button;

		public var btn_max:feathers.controls.Button;

		public var btn_min:feathers.controls.Button;

		public var btn_ok:feathers.controls.Button;

		public var icon_all:feathers.controls.UIAsset;

		public var icon_arrow:feathers.controls.UIAsset;

		public var icon_part1:feathers.controls.UIAsset;

		public var icon_part2:feathers.controls.UIAsset;

		public var lbl_currentNum:feathers.controls.Label;

		public var lbl_title:feathers.controls.Label;

		public var slider:feathers.controls.Slider;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function wupingchaifen()
		{
			super();
			
			this.currentState = "normal";
			this.height = 250;
			this.width = 337;
			this.elementsContent = [bg_i(),__wupingchaifen_UIAsset1_i(),lbl_title_i(),btnClose_i(),btn_ok_i(),btn_cancel_i(),icon_all_i(),icon_part1_i(),icon_part2_i(),icon_arrow_i(),__wupingchaifen_Label1_i(),__wupingchaifen_Label2_i(),slider_i(),btn_min_i(),btn_max_i(),__wupingchaifen_UIAsset2_i(),lbl_currentNum_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __wupingchaifen_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.htmlText = "需要将这组物品<font color='#5DBD37'>拆分</font>成两堆吗?";
			temp.letterSpacing = 0;
			temp.text = "标签";
			temp.color = 0x8b8d7b;
			temp.x = 75;
			temp.y = 106;
			return temp;
		}

		private function __wupingchaifen_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.text = "请点击调节栏输入要拆分的数量";
			temp.color = 0x8b8d7b;
			temp.x = 75;
			temp.y = 125;
			return temp;
		}

		private function __wupingchaifen_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 154;
			temp.styleName = "ui/common/background/neikuang_2.png";
			temp.width = 315;
			temp.x = 11;
			temp.y = 41;
			return temp;
		}

		private function __wupingchaifen_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/xiaobiaotibeijing.png";
			temp.width = 66;
			temp.x = 240;
			temp.y = 154;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 250;
			temp.styleName = "ui/common/background/erji_kuang.png";
			temp.width = 337;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.x = 301;
			temp.y = 7;
			return temp;
		}

		private function btn_cancel_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_cancel = temp;
			temp.name = "btn_cancel";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 95;
			temp.x = 212;
			temp.y = 201;
			return temp;
		}

		private function btn_max_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_max = temp;
			temp.name = "btn_max";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jia;
			temp.x = 215;
			temp.y = 155;
			return temp;
		}

		private function btn_min_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_min = temp;
			temp.name = "btn_min";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_jian;
			temp.x = 32;
			temp.y = 155;
			return temp;
		}

		private function btn_ok_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_ok = temp;
			temp.name = "btn_ok";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "拆 分";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong;
			temp.width = 95;
			temp.x = 61;
			temp.y = 201;
			return temp;
		}

		private function icon_all_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_all = temp;
			temp.name = "icon_all";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 70;
			temp.y = 48;
			return temp;
		}

		private function icon_arrow_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_arrow = temp;
			temp.name = "icon_arrow";
			temp.styleName = "ui/common/tubiao/jiantou.png";
			temp.x = 133;
			temp.y = 65;
			return temp;
		}

		private function icon_part1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_part1 = temp;
			temp.name = "icon_part1";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 173;
			temp.y = 48;
			return temp;
		}

		private function icon_part2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon_part2 = temp;
			temp.name = "icon_part2";
			temp.styleName = "ui/common/gezikuang/tubiaodikuang/42.png";
			temp.x = 229;
			temp.y = 48;
			return temp;
		}

		private function lbl_currentNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_currentNum = temp;
			temp.name = "lbl_currentNum";
			temp.fontSize = 14;
			temp.text = "100";
			temp.textAlign = "center";
			temp.color = 0xF1EFC7;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 62;
			temp.x = 242;
			temp.y = 158;
			return temp;
		}

		private function lbl_title_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbl_title = temp;
			temp.name = "lbl_title";
			temp.bold = true;
			temp.letterSpacing = 2;
			temp.fontSize = 16;
			temp.text = "物品拆分";
			temp.textAlign = "center";
			temp.color = 0xb8ad80;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 173;
			temp.x = 88;
			temp.y = 11;
			return temp;
		}

		private function slider_i():feathers.controls.Slider
		{
			var temp:feathers.controls.Slider = new feathers.controls.Slider();
			slider = temp;
			temp.name = "slider";
			temp.direction = Slider.DIRECTION_HORIZONTAL
			temp.styleClass = org.mokylin.skin.component.slider.skin_Slider;
			temp.value = 2;
			temp.width = 156;
			temp.x = 57;
			temp.y = 150;
			return temp;
		}

	}
}