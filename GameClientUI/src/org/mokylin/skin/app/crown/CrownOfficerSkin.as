package org.mokylin.skin.app.crown
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_button;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CrownOfficerSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var officeBg:feathers.controls.UIAsset;

		public var officeDes:feathers.controls.Label;

		public var officerName:feathers.controls.Label;

		public var officerPosName:feathers.controls.Label;

		public var prizeGrid0:feathers.controls.UIAsset;

		public var receiveBtn:feathers.controls.Button;

		public var zaiweiTimeLbl:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownOfficerSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__CrownOfficerSkin_UIAsset1_i(),officeBg_i(),officerName_i(),officerPosName_i(),__CrownOfficerSkin_Label1_i(),officeDes_i(),__CrownOfficerSkin_Label2_i(),receiveBtn_i(),__CrownOfficerSkin_UIAsset2_i(),zaiweiTimeLbl_i(),prizeGrid0_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownOfficerSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "<TEXTFORMAT LEADING=\"2\"><P ALIGN=\"LEFT\"><FONT FACE=\"Microsoft YaHei\" SIZE=\"14\" COLOR=\"#DDDABA\" LETTERSPACING=\"0\" KERNING=\"0\">在位时长：</FONT></P></TEXTFORMAT>";
			temp.fontSize = 14;
			temp.text = "在位时长：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 651;
			temp.y = 52;
			return temp;
		}

		private function __CrownOfficerSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 12;
			temp.text = "每日俸禄";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.width = 77;
			temp.x = 716;
			temp.y = 388;
			return temp;
		}

		private function __CrownOfficerSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guanquan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownOfficerSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/guowang/fengexian.png";
			temp.x = 627;
			temp.y = 268;
			return temp;
		}

		private function officeBg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			officeBg = temp;
			temp.name = "officeBg";
			temp.styleName = "ui/big_bg/jinwuwei.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function officeDes_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			officeDes = temp;
			temp.name = "officeDes";
			temp.bold = false;
			temp.height = 122;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "大都督描述。。。";
			temp.color = 0xDDDABA;
			temp.width = 207;
			temp.x = 651;
			temp.y = 132;
			return temp;
		}

		private function officerName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			officerName = temp;
			temp.name = "officerName";
			temp.bold = false;
			temp.height = 29;
			temp.fontSize = 14;
			temp.text = "花花你个花花";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 131;
			temp.x = 651;
			temp.y = 23;
			return temp;
		}

		private function officerPosName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			officerPosName = temp;
			temp.name = "officerPosName";
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "大都督";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 131;
			temp.x = 651;
			temp.y = 103;
			return temp;
		}

		private function prizeGrid0_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			prizeGrid0 = temp;
			temp.name = "prizeGrid0";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 731;
			temp.y = 335;
			return temp;
		}

		private function receiveBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			receiveBtn = temp;
			temp.name = "receiveBtn";
			temp.label = "领  取";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 116;
			temp.x = 698;
			temp.y = 414;
			return temp;
		}

		private function zaiweiTimeLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			zaiweiTimeLbl = temp;
			temp.name = "zaiweiTimeLbl";
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "35天";
			temp.color = 0xF4BD63;
			temp.width = 82;
			temp.x = 727;
			temp.y = 52;
			return temp;
		}

	}
}