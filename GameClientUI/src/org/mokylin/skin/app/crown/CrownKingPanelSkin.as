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
	public class CrownKingPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var emperor:feathers.controls.Label;

		public var emperorBtn:feathers.controls.Button;

		public var guowangName:feathers.controls.Label;

		public var kingPingJiaLbl0:feathers.controls.Label;

		public var minxingLbl:feathers.controls.Label;

		public var prizeGrid:feathers.controls.UIAsset;

		public var receiveBtn:feathers.controls.Button;

		public var tongzhiliLbl:feathers.controls.Label;

		public var zaiweiTimeLbl:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CrownKingPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 496;
			this.width = 883;
			this.elementsContent = [__CrownKingPanelSkin_UIAsset1_i(),guowangName_i(),__CrownKingPanelSkin_Label1_i(),__CrownKingPanelSkin_Label2_i(),__CrownKingPanelSkin_Label3_i(),zaiweiTimeLbl_i(),__CrownKingPanelSkin_Label4_i(),tongzhiliLbl_i(),__CrownKingPanelSkin_Label5_i(),minxingLbl_i(),emperor_i(),__CrownKingPanelSkin_Label6_i(),kingPingJiaLbl0_i(),emperorBtn_i(),receiveBtn_i(),__CrownKingPanelSkin_UIAsset2_i(),__CrownKingPanelSkin_UIAsset3_i(),__CrownKingPanelSkin_UIAsset4_i(),__CrownKingPanelSkin_UIAsset5_i(),prizeGrid_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CrownKingPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 12;
			temp.text = "每日俸禄";
			temp.textAlign = "center";
			temp.color = 0xF4BD63;
			temp.width = 77;
			temp.x = 717;
			temp.y = 418;
			return temp;
		}

		private function __CrownKingPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "在位时长：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 649;
			temp.y = 52;
			return temp;
		}

		private function __CrownKingPanelSkin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "国王名称：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 649;
			temp.y = 22;
			return temp;
		}

		private function __CrownKingPanelSkin_Label4_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "统  治  力：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 649;
			temp.y = 80;
			return temp;
		}

		private function __CrownKingPanelSkin_Label5_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "民       心：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 649;
			temp.y = 105;
			return temp;
		}

		private function __CrownKingPanelSkin_Label6_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "国王评价：";
			temp.color = 0xDDDABA;
			temp.width = 82;
			temp.x = 649;
			temp.y = 131;
			return temp;
		}

		private function __CrownKingPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guanquan.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __CrownKingPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/guowang.jpg";
			temp.x = 6;
			temp.y = 6;
			return temp;
		}

		private function __CrownKingPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/guowang/fengexian.png";
			temp.x = 627;
			temp.y = 338;
			return temp;
		}

		private function __CrownKingPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/crown/guowang/fengexian.png";
			temp.x = 627;
			temp.y = 164;
			return temp;
		}

		private function __CrownKingPanelSkin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/grid/normal/46.png";
			temp.x = 726;
			temp.y = 363;
			return temp;
		}

		private function emperorBtn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			emperorBtn = temp;
			temp.name = "emperorBtn";
			temp.height = 33;
			temp.label = "发布公告";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_button);
			temp.width = 115;
			temp.x = 698;
			temp.y = 291;
			return temp;
		}

		private function emperor_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			emperor = temp;
			temp.name = "emperor";
			temp.bold = false;
			temp.height = 104;
			temp.htmlText = "";
			temp.maxWidth = 220;
			temp.fontSize = 14;
			temp.text = "黄帝旨意：";
			temp.color = 0xF4BD63;
			temp.width = 215;
			temp.x = 644;
			temp.y = 184;
			return temp;
		}

		private function guowangName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			guowangName = temp;
			temp.name = "guowangName";
			temp.bold = false;
			temp.height = 20;
			temp.fontSize = 14;
			temp.text = "花花你个花花";
			temp.textAlign = "left";
			temp.color = 0xF4BD63;
			temp.width = 131;
			temp.x = 725;
			temp.y = 23;
			return temp;
		}

		private function kingPingJiaLbl0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			kingPingJiaLbl0 = temp;
			temp.name = "kingPingJiaLbl0";
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "优秀国王";
			temp.color = 0xCC99BB;
			temp.width = 139;
			temp.x = 725;
			temp.y = 131;
			return temp;
		}

		private function minxingLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			minxingLbl = temp;
			temp.name = "minxingLbl";
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "90%";
			temp.color = 0x60BE2D;
			temp.width = 82;
			temp.x = 725;
			temp.y = 105;
			return temp;
		}

		private function prizeGrid_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			prizeGrid = temp;
			temp.name = "prizeGrid";
			temp.styleName = "ui/common/tubiao/bangpaizijin48.png";
			temp.x = 730;
			temp.y = 366;
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
			temp.y = 444;
			return temp;
		}

		private function tongzhiliLbl_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			tongzhiliLbl = temp;
			temp.name = "tongzhiliLbl";
			temp.bold = false;
			temp.height = 22;
			temp.htmlText = "";
			temp.fontSize = 14;
			temp.text = "99/200";
			temp.color = 0x60BE2D;
			temp.width = 82;
			temp.x = 725;
			temp.y = 80;
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
			temp.x = 725;
			temp.y = 52;
			return temp;
		}

	}
}