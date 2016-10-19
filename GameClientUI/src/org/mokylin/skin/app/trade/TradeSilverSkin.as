package org.mokylin.skin.app.trade
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextInput;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
	import org.mokylin.skin.component.text.TextInput5Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TradeSilverSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var cancelBtn:feathers.controls.Button;

		public var closeBtn:feathers.controls.Button;

		public var ding:feathers.controls.TextInput;

		public var liang:feathers.controls.TextInput;

		public var silverBtn:feathers.controls.Button;

		public var wen:feathers.controls.TextInput;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TradeSilverSkin()
		{
			super();
			
			this.currentState = "normal";
			this.width = 320;
			this.elementsContent = [__TradeSilverSkin_UIAsset1_i(),closeBtn_i(),ding_i(),liang_i(),__TradeSilverSkin_Label1_i(),__TradeSilverSkin_Label2_i(),__TradeSilverSkin_Label3_i(),wen_i(),__TradeSilverSkin_Label4_i(),silverBtn_i(),cancelBtn_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TradeSilverSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "锭";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 92;
			temp.y = 44;
			return temp;
		}

		private function __TradeSilverSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "请输入交易数额：";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 163;
			temp.x = 25;
			temp.y = 15;
			return temp;
		}

		private function __TradeSilverSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "两";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 194;
			temp.y = 44;
			return temp;
		}

		private function __TradeSilverSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "文";
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 287;
			temp.y = 44;
			return temp;
		}

		private function __TradeSilverSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 126;
			temp.styleName = "ui/common/tip/equipTips/dikuang/tipsBg.png";
			temp.width = 320;
			return temp;
		}

		private function cancelBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			cancelBtn = temp;
			temp.name = "cancelBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "取 消";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 54;
			temp.x = 176;
			temp.y = 82;
			return temp;
		}

		private function closeBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			closeBtn = temp;
			temp.name = "closeBtn";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 293;
			temp.y = 0;
			return temp;
		}

		private function ding_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			ding = temp;
			temp.name = "ding";
			temp.height = 25;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput5Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 23;
			temp.y = 45;
			return temp;
		}

		private function liang_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			liang = temp;
			temp.name = "liang";
			temp.height = 25;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput5Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 118;
			temp.y = 45;
			return temp;
		}

		private function silverBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			silverBtn = temp;
			temp.name = "silverBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "确 认";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_s_sanjianniu);
			temp.color = 0xF9F0CC;
			temp.width = 54;
			temp.x = 86;
			temp.y = 82;
			return temp;
		}

		private function wen_i():feathers.controls.TextInput
		{
			var temp:feathers.controls.TextInput = new feathers.controls.TextInput();
			wen = temp;
			temp.name = "wen";
			temp.height = 25;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextInput5Skin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 65;
			temp.x = 216;
			temp.y = 45;
			return temp;
		}

	}
}