package org.mokylin.skin.common
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import feathers.layout.VerticalLayout;
	import org.mokylin.skin.component.text.TextAreaSkin;
	import org.mokylin.skin.component.text.TextInputSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ConsolePanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var grpBg:feathers.controls.UIAsset;

		public var grpHistory:feathers.controls.Group;

		public var imgTips:feathers.controls.UIAsset;

		public var lb0:feathers.controls.Label;

		public var lb1:feathers.controls.Label;

		public var lb2:feathers.controls.Label;

		public var lb3:feathers.controls.Label;

		public var lb4:feathers.controls.Label;

		public var txtArea:feathers.controls.TextArea;

		public var txtInput:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ConsolePanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 500;
			this.width = 980;
			this.elementsContent = [txtArea_i(),txtInput_i(),grpBg_i(),grpHistory_i(),imgTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ConsolePanelSkin_VerticalLayout1_i():feathers.layout.VerticalLayout
		{
			var temp:feathers.layout.VerticalLayout = new feathers.layout.VerticalLayout();
			return temp;
		}

		private function grpBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			grpBg = temp;
			temp.name = "grpBg";
			temp.height = 122;
			temp.styleName = "ui/common/tip/tips.png";
			temp.width = 940;
			temp.x = 28;
			temp.y = 505;
			return temp;
		}

		private function grpHistory_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpHistory = temp;
			temp.name = "grpHistory";
			temp.height = 117;
			temp.width = 940;
			temp.x = 28;
			temp.y = 476;
			temp.layout = __ConsolePanelSkin_VerticalLayout1_i();
			temp.elementsContent = [lb0_i(),lb1_i(),lb2_i(),lb3_i(),lb4_i()];
			return temp;
		}

		private function imgTips_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgTips = temp;
			temp.name = "imgTips";
			temp.styleName = "ui/common/icon/bangzhu.png";
			temp.x = 0;
			temp.y = 474;
			return temp;
		}

		private function lb0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb0 = temp;
			temp.name = "lb0";
			temp.text = " ";
			temp.color = 0xFFFFFF;
			temp.width = 935;
			temp.x = 95;
			temp.y = 303;
			return temp;
		}

		private function lb1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb1 = temp;
			temp.name = "lb1";
			temp.text = " ";
			temp.color = 0xFFFFFF;
			temp.width = 935;
			temp.x = 246;
			temp.y = 43;
			return temp;
		}

		private function lb2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb2 = temp;
			temp.name = "lb2";
			temp.text = " ";
			temp.color = 0xFFFFFF;
			temp.width = 935;
			temp.x = 195;
			temp.y = 103;
			return temp;
		}

		private function lb3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb3 = temp;
			temp.name = "lb3";
			temp.text = " ";
			temp.color = 0xFFFFFF;
			temp.width = 935;
			temp.x = 115;
			temp.y = 143;
			return temp;
		}

		private function lb4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb4 = temp;
			temp.name = "lb4";
			temp.text = " ";
			temp.color = 0xFFFFFF;
			temp.width = 935;
			temp.x = 202;
			temp.y = 217;
			return temp;
		}

		private function txtArea_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			txtArea = temp;
			temp.name = "txtArea";
			temp.bold = false;
			temp.height = 471;
			temp.italic = true;
			temp.leading = 7;
			temp.styleClass = org.mokylin.skin.component.text.TextAreaSkin;
			temp.text = "文本内容";
			temp.textAlign = "left";
			temp.color = 0xF09E01;
			temp.nativeFilters = Fontter.filterObj[""];
			temp.width = 980;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function txtInput_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			txtInput = temp;
			temp.name = "txtInput";
			temp.height = 28;
			temp.styleClass = org.mokylin.skin.component.text.TextInputSkin;
			temp.width = 940;
			temp.x = 28;
			temp.y = 475;
			return temp;
		}

	}
}