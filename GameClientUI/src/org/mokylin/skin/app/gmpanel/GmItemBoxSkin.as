package org.mokylin.skin.app.gmpanel
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.ComboBox;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.combobox.ComboBox1_Skin;
	import org.mokylin.skin.component.text.textInput3_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class GmItemBoxSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnConfirm:feathers.controls.Button;

		public var itemId:feathers.controls.ComboBox;

		public var labInfo:feathers.controls.TextInput;

		public var labTitle:feathers.controls.Label;

		public var labTitle0:feathers.controls.Label;

		public var labTitle1:feathers.controls.Label;

		public var labTitle2:feathers.controls.Label;

		public var labTitle3:feathers.controls.Label;

		public var lbItemID:feathers.controls.TextInput;

		public var qianzhui:feathers.controls.ComboBox;

		public var quality:feathers.controls.ComboBox;

		public var type:feathers.controls.ComboBox;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function GmItemBoxSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 400;
			this.width = 900;
			this.elementsContent = [btnConfirm_i(),labTitle_i(),labTitle0_i(),labTitle2_i(),type_i(),itemId_i(),labTitle1_i(),quality_i(),labTitle3_i(),qianzhui_i(),labInfo_i(),lbItemID_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function btnConfirm_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnConfirm = temp;
			temp.name = "btnConfirm";
			temp.label = "按钮";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.width = 94;
			temp.x = 790;
			temp.y = 21;
			return temp;
		}

		private function itemId_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			itemId = temp;
			temp.name = "itemId";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 301;
			temp.x = 136;
			temp.y = 24;
			return temp;
		}

		private function labInfo_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			labInfo = temp;
			temp.name = "labInfo";
			temp.height = 24;
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.text = "1";
			temp.color = 0xE12E06;
			temp.width = 64;
			temp.x = 724;
			temp.y = 24;
			return temp;
		}

		private function labTitle0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle0 = temp;
			temp.name = "labTitle0";
			temp.text = "物品";
			temp.textAlign = "left";
			temp.width = 115;
			temp.x = 136;
			temp.y = 6;
			return temp;
		}

		private function labTitle1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle1 = temp;
			temp.name = "labTitle1";
			temp.text = "品质";
			temp.textAlign = "left";
			temp.width = 115;
			temp.x = 468;
			temp.y = 6;
			return temp;
		}

		private function labTitle2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle2 = temp;
			temp.name = "labTitle2";
			temp.text = "数量";
			temp.textAlign = "left";
			temp.width = 65;
			temp.x = 725;
			temp.y = 6;
			return temp;
		}

		private function labTitle3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle3 = temp;
			temp.name = "labTitle3";
			temp.text = "前缀";
			temp.textAlign = "left";
			temp.width = 115;
			temp.x = 598;
			temp.y = 6;
			return temp;
		}

		private function labTitle_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labTitle = temp;
			temp.name = "labTitle";
			temp.text = "类型";
			temp.textAlign = "left";
			temp.width = 115;
			temp.x = 7;
			temp.y = 6;
			return temp;
		}

		private function lbItemID_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			lbItemID = temp;
			temp.name = "lbItemID";
			temp.styleClass = org.mokylin.skin.component.text.textInput3_Skin;
			temp.x = 9;
			temp.y = 69;
			return temp;
		}

		private function qianzhui_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			qianzhui = temp;
			temp.name = "qianzhui";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.width = 118;
			temp.x = 598;
			temp.y = 24;
			return temp;
		}

		private function quality_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			quality = temp;
			temp.name = "quality";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.width = 118;
			temp.x = 468;
			temp.y = 24;
			return temp;
		}

		private function type_i():feathers.controls.ComboBox
		{
			var temp:feathers.controls.ComboBox = new feathers.controls.ComboBox();
			type = temp;
			temp.name = "type";
			temp.height = 22;
			temp.styleClass = org.mokylin.skin.component.combobox.ComboBox1_Skin;
			temp.width = 118;
			temp.x = 6;
			temp.y = 24;
			return temp;
		}

	}
}