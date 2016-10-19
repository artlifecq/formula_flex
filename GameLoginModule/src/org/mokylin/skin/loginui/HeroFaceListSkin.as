package org.mokylin.skin.loginui
{
	import feathers.controls.Radio;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.loginui.button.ButtonSkin_loginFace;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HeroFaceListSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var faceBtn1:feathers.controls.Radio;

		public var faceBtn2:feathers.controls.Radio;

		public var faceBtn3:feathers.controls.Radio;

		public var faceBtn4:feathers.controls.Radio;

		public var faceBtn5:feathers.controls.Radio;

		public var faceBtn6:feathers.controls.Radio;

		public var faceBtn7:feathers.controls.Radio;

		public var faceBtn8:feathers.controls.Radio;

		public var man1:feathers.controls.UIAsset;

		public var man2:feathers.controls.UIAsset;

		public var man3:feathers.controls.UIAsset;

		public var man4:feathers.controls.UIAsset;

		public var man5:feathers.controls.UIAsset;

		public var man6:feathers.controls.UIAsset;

		public var man7:feathers.controls.UIAsset;

		public var man8:feathers.controls.UIAsset;

		public var woman1:feathers.controls.UIAsset;

		public var woman2:feathers.controls.UIAsset;

		public var woman3:feathers.controls.UIAsset;

		public var woman4:feathers.controls.UIAsset;

		public var woman5:feathers.controls.UIAsset;

		public var woman6:feathers.controls.UIAsset;

		public var woman7:feathers.controls.UIAsset;

		public var woman8:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HeroFaceListSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 924;
			this.width = 1643;
			this.elementsContent = [__HeroFaceListSkin_UIAsset1_i(),man1_i(),man2_i(),man3_i(),man4_i(),man5_i(),man6_i(),man7_i(),man8_i(),woman1_i(),woman2_i(),woman3_i(),woman4_i(),woman5_i(),woman6_i(),woman7_i(),woman8_i(),faceBtn1_i(),faceBtn2_i(),faceBtn3_i(),faceBtn4_i(),faceBtn5_i(),faceBtn6_i(),faceBtn7_i(),faceBtn8_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __HeroFaceListSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 166;
			temp.styleName = "ui/loginui/loginuiOther/face/dikuang.png";
			temp.width = 292;
			temp.x = 1295;
			temp.y = 50;
			return temp;
		}

		private function faceBtn1_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn1 = temp;
			temp.name = "faceBtn1";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1303;
			temp.y = 61;
			return temp;
		}

		private function faceBtn2_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn2 = temp;
			temp.name = "faceBtn2";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1371;
			temp.y = 61;
			return temp;
		}

		private function faceBtn3_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn3 = temp;
			temp.name = "faceBtn3";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1439;
			temp.y = 61;
			return temp;
		}

		private function faceBtn4_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn4 = temp;
			temp.name = "faceBtn4";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1508;
			temp.y = 61;
			return temp;
		}

		private function faceBtn5_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn5 = temp;
			temp.name = "faceBtn5";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1303;
			temp.y = 133;
			return temp;
		}

		private function faceBtn6_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn6 = temp;
			temp.name = "faceBtn6";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1371;
			temp.y = 133;
			return temp;
		}

		private function faceBtn7_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn7 = temp;
			temp.name = "faceBtn7";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1439;
			temp.y = 133;
			return temp;
		}

		private function faceBtn8_i():feathers.controls.Radio
		{
			var temp:feathers.controls.Radio = new feathers.controls.Radio();
			faceBtn8 = temp;
			temp.name = "faceBtn8";
			temp.height = 73;
			temp.styleClass = org.mokylin.skin.loginui.button.ButtonSkin_loginFace;
			temp.width = 71;
			temp.x = 1508;
			temp.y = 133;
			return temp;
		}

		private function man1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man1 = temp;
			temp.name = "man1";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_1.png";
			temp.width = 64;
			temp.x = 1307;
			temp.y = 65;
			return temp;
		}

		private function man2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man2 = temp;
			temp.name = "man2";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_2.png";
			temp.width = 64;
			temp.x = 1375;
			temp.y = 65;
			return temp;
		}

		private function man3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man3 = temp;
			temp.name = "man3";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_3.png";
			temp.width = 64;
			temp.x = 1443;
			temp.y = 65;
			return temp;
		}

		private function man4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man4 = temp;
			temp.name = "man4";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_4.png";
			temp.width = 64;
			temp.x = 1511;
			temp.y = 65;
			return temp;
		}

		private function man5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man5 = temp;
			temp.name = "man5";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_5.png";
			temp.width = 64;
			temp.x = 1307;
			temp.y = 138;
			return temp;
		}

		private function man6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man6 = temp;
			temp.name = "man6";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_6.png";
			temp.width = 64;
			temp.x = 1375;
			temp.y = 138;
			return temp;
		}

		private function man7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man7 = temp;
			temp.name = "man7";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_7.png";
			temp.width = 64;
			temp.x = 1443;
			temp.y = 138;
			return temp;
		}

		private function man8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			man8 = temp;
			temp.name = "man8";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nan_8.png";
			temp.width = 64;
			temp.x = 1511;
			temp.y = 138;
			return temp;
		}

		private function woman1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman1 = temp;
			temp.name = "woman1";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_1.png";
			temp.width = 64;
			temp.x = 1307;
			temp.y = 65;
			return temp;
		}

		private function woman2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman2 = temp;
			temp.name = "woman2";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_2.png";
			temp.width = 64;
			temp.x = 1375;
			temp.y = 65;
			return temp;
		}

		private function woman3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman3 = temp;
			temp.name = "woman3";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_3.png";
			temp.width = 64;
			temp.x = 1443;
			temp.y = 65;
			return temp;
		}

		private function woman4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman4 = temp;
			temp.name = "woman4";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_4.png";
			temp.width = 64;
			temp.x = 1511;
			temp.y = 65;
			return temp;
		}

		private function woman5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman5 = temp;
			temp.name = "woman5";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_5.png";
			temp.width = 64;
			temp.x = 1307;
			temp.y = 138;
			return temp;
		}

		private function woman6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman6 = temp;
			temp.name = "woman6";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_6.png";
			temp.width = 64;
			temp.x = 1375;
			temp.y = 138;
			return temp;
		}

		private function woman7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman7 = temp;
			temp.name = "woman7";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_7.png";
			temp.width = 64;
			temp.x = 1443;
			temp.y = 138;
			return temp;
		}

		private function woman8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			woman8 = temp;
			temp.name = "woman8";
			temp.height = 64;
			temp.styleName = "ui/loginui/loginuiOther/face/touxiang_nv_8.png";
			temp.width = 64;
			temp.x = 1511;
			temp.y = 138;
			return temp;
		}

	}
}