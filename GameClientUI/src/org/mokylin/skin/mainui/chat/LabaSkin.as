package org.mokylin.skin.mainui.chat
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.text.TextAreaSkin;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_face;
	import org.mokylin.skin.mainui.chat.button.ButtonSkin_location;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class LabaSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnFace:feathers.controls.Button;

		public var btnLocation:feathers.controls.Button;

		public var sendBtn:feathers.controls.Button;

		public var textInput:feathers.controls.TextArea;

		public var txt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function LabaSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__LabaSkin_UIAsset1_i(),__LabaSkin_UIAsset2_i(),btnClose_i(),__LabaSkin_Label1_i(),textInput_i(),__LabaSkin_UIAsset3_i(),txt_i(),sendBtn_i(),btnFace_i(),btnLocation_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __LabaSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.fontSize = 14;
			temp.text = "小喇叭";
			temp.textAlign = "center";
			temp.color = 0xDFC8AF;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 108;
			temp.x = 182;
			temp.y = 16;
			return temp;
		}

		private function __LabaSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 204;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/er_ji_mian_ban.png";
			temp.width = 472;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __LabaSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 27;
			temp.styleName = "ui/common/kang/neikuang1.png";
			temp.width = 315;
			temp.x = 19;
			temp.y = 152;
			return temp;
		}

		private function __LabaSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/version_3/B_bujian/la_ba.png";
			temp.x = 21;
			temp.y = 157;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonV3_g_guanbi);
			temp.x = 431;
			temp.y = 6;
			return temp;
		}

		private function btnFace_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnFace = temp;
			temp.name = "btnFace";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_face);
			temp.width = 20;
			temp.x = 340;
			temp.y = 157;
			return temp;
		}

		private function btnLocation_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnLocation = temp;
			temp.name = "btnLocation";
			temp.height = 20;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.mainui.chat.button.ButtonSkin_location);
			temp.width = 20;
			temp.x = 361;
			temp.y = 157;
			return temp;
		}

		private function sendBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			sendBtn = temp;
			temp.name = "sendBtn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.height = 36;
			temp.label = "发送";
			temp.fontSize = 14;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_mount_btn_erji);
			temp.color = 0xF9F0CC;
			temp.width = 70;
			temp.x = 384;
			temp.y = 150;
			return temp;
		}

		private function textInput_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			textInput = temp;
			temp.name = "textInput";
			temp.height = 112;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextAreaSkin);
			temp.color = 0xF9F0CC;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 441;
			temp.x = 16;
			temp.y = 38;
			return temp;
		}

		private function txt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			txt = temp;
			temp.name = "txt";
			temp.height = 20;
			temp.text = "标签";
			temp.color = 0x9C8049;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 208;
			temp.x = 55;
			temp.y = 156;
			return temp;
		}

	}
}