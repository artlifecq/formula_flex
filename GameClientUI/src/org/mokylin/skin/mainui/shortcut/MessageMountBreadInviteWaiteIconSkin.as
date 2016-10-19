package org.mokylin.skin.mainui.shortcut
{
	import feathers.controls.text.Fontter;
	import feathers.themes.GuiThemeStyle;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.version_3.T_tubiao.T_tishitubiao.button.ButtonYou_jian;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MessageMountBreadInviteWaiteIconSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn:feathers.controls.Button;

		public var labInviteExpireTime:feathers.controls.Label;

		public var numTxt:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MessageMountBreadInviteWaiteIconSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 41;
			this.width = 50;
			this.elementsContent = [__MessageMountBreadInviteWaiteIconSkin_UIAsset1_i(),btn_i(),numTxt_i(),labInviteExpireTime_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MessageMountBreadInviteWaiteIconSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/kang/2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn = temp;
			temp.name = "btn";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			GuiThemeStyle.setFeatherSkinClass(temp,org.mokylin.skin.common.version_3.T_tubiao.T_tishitubiao.button.ButtonYou_jian);
			temp.color = 0xF9F0CC;
			temp.x = 7;
			temp.y = 7;
			return temp;
		}

		private function labInviteExpireTime_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labInviteExpireTime = temp;
			temp.name = "labInviteExpireTime";
			temp.height = 18;
			temp.textAlign = "center";
			temp.color = 0xFF0000;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 140;
			temp.x = -45;
			temp.y = 40;
			return temp;
		}

		private function numTxt_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numTxt = temp;
			temp.name = "numTxt";
			temp.touchable = false;
			temp.color = 0xFFFFFF;
			temp.x = 22;
			temp.y = 0;
			return temp;
		}

	}
}