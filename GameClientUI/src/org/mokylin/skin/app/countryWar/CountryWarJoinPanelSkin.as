package org.mokylin.skin.app.countryWar
{
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.TextArea;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonSkin_close;
	import org.mokylin.skin.component.button.ButtonSkin_green2;
	import org.mokylin.skin.component.text.TextBlankSkin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class CountryWarJoinPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnClose:feathers.controls.Button;

		public var btnWar:feathers.controls.Button;

		public var labDic:feathers.controls.TextArea;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function CountryWarJoinPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 221;
			this.width = 517;
			this.elementsContent = [__CountryWarJoinPanelSkin_UIAsset1_i(),btnClose_i(),__CountryWarJoinPanelSkin_Label1_i(),__CountryWarJoinPanelSkin_Label2_i(),btnWar_i(),labDic_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __CountryWarJoinPanelSkin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 17;
			temp.touchable = false;
			temp.fontSize = 14;
			temp.text = "参 战";
			temp.width = 41;
			temp.x = 236.5;
			temp.y = 11;
			return temp;
		}

		private function __CountryWarJoinPanelSkin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 21;
			temp.text = "主战场攻略";
			temp.color = 0xDED8C7;
			temp.width = 191;
			temp.x = 31;
			temp.y = 57;
			return temp;
		}

		private function __CountryWarJoinPanelSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 220;
			temp.styleName = "ui/common/backgound/tyzk.png";
			temp.width = 514;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_close);
			temp.x = 478;
			temp.y = 4;
			return temp;
		}

		private function btnWar_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnWar = temp;
			temp.name = "btnWar";
			temp.label = "参 战";
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.button.ButtonSkin_green2);
			temp.width = 100;
			temp.x = 362;
			temp.y = 107;
			return temp;
		}

		private function labDic_i():feathers.controls.TextArea
		{
			var temp:feathers.controls.TextArea = new feathers.controls.TextArea();
			labDic = temp;
			temp.name = "labDic";
			temp.height = 68;
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.component.text.TextBlankSkin);
			temp.text = "1、守护阳平关镇关守将2、守护城西复活点3、高级玩家进入内城守朱雀、玄武封印、被夺后攻击可夺回4、守护内城神兽，直至国战结束";
			temp.color = 0xDED8C7;
			temp.width = 299;
			temp.x = 30;
			temp.y = 95;
			return temp;
		}

	}
}