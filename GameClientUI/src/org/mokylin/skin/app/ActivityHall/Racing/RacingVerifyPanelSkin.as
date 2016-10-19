package org.mokylin.skin.app.ActivityHall.Racing
{
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.component.button.ButtonV3_g_guanbi;
	import org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
	import org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class RacingVerifyPanelSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btnAnswer0:feathers.controls.Button;

		public var btnAnswer1:feathers.controls.Button;

		public var btnAnswer2:feathers.controls.Button;

		public var btnAnswer3:feathers.controls.Button;

		public var btnClose:feathers.controls.Button;

		public var btnRefresh:feathers.controls.Button;

		public var imageQuestion:feathers.controls.UIAsset;

		public var lbQuestion:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function RacingVerifyPanelSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__RacingVerifyPanelSkin_UIAsset2_i(),btnClose_i(),__RacingVerifyPanelSkin_UIAsset3_i(),__RacingVerifyPanelSkin_UIAsset4_i(),lbQuestion_i(),btnAnswer0_i(),btnAnswer1_i(),btnAnswer2_i(),btnAnswer3_i(),btnRefresh_i(),imageQuestion_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __RacingVerifyPanelSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 312;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/san_ji_mian_ban.png";
			temp.width = 310;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __RacingVerifyPanelSkin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 200;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/common/version_3/T_tongyongbanzi/nei_kuang.png";
			temp.width = 274;
			temp.x = 18;
			temp.y = 48;
			return temp;
		}

		private function __RacingVerifyPanelSkin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = false;
			temp.styleName = "ui/app/racingVerify/yanZhengma.png";
			temp.x = 31;
			temp.y = 63;
			return temp;
		}

		private function btnAnswer0_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAnswer0 = temp;
			temp.name = "btnAnswer0";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.width = 61;
			temp.x = 54;
			temp.y = 176;
			return temp;
		}

		private function btnAnswer1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAnswer1 = temp;
			temp.name = "btnAnswer1";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.width = 61;
			temp.x = 194;
			temp.y = 176;
			return temp;
		}

		private function btnAnswer2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAnswer2 = temp;
			temp.name = "btnAnswer2";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.width = 61;
			temp.x = 54;
			temp.y = 206;
			return temp;
		}

		private function btnAnswer3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnAnswer3 = temp;
			temp.name = "btnAnswer3";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_s_sanjianniu;
			temp.width = 61;
			temp.x = 194;
			temp.y = 206;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_g_guanbi;
			temp.x = 277;
			temp.y = 1;
			return temp;
		}

		private function btnRefresh_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnRefresh = temp;
			temp.name = "btnRefresh";
			temp.label = "刷 新";
			temp.styleClass = org.mokylin.skin.component.button.ButtonV3_t_tongyonganniu;
			temp.x = 103;
			temp.y = 253;
			return temp;
		}

		private function imageQuestion_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imageQuestion = temp;
			temp.name = "imageQuestion";
			temp.height = 89;
			temp.touchable = false;
			temp.touchGroup = false;
			temp.width = 207;
			temp.x = 50;
			temp.y = 70;
			return temp;
		}

		private function lbQuestion_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbQuestion = temp;
			temp.name = "lbQuestion";
			temp.touchable = false;
			temp.touchGroup = false;
			temp.fontSize = 16;
			temp.text = "标签";
			temp.textAlign = "center";
			temp.width = 257;
			temp.x = 26;
			temp.y = 22;
			return temp;
		}

	}
}