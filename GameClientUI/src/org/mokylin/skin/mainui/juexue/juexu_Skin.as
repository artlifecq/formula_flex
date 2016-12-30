package org.mokylin.skin.mainui.juexue
{
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class juexu_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var btn_j1:feathers.controls.Button;

		public var btn_j2:feathers.controls.Button;

		public var btn_j3:feathers.controls.Button;

		public var btn_j4:feathers.controls.Button;

		public var btn_j5:feathers.controls.Button;

		public var btn_j6:feathers.controls.Button;

		public var btn_jx:feathers.controls.Group;

		public var juexue:feathers.controls.Group;

		public var sh:feathers.controls.Group;

		public var sh1:feathers.controls.UIAsset;

		public var sh2:feathers.controls.UIAsset;

		public var sh3:feathers.controls.UIAsset;

		public var sh4:feathers.controls.UIAsset;

		public var sh5:feathers.controls.UIAsset;

		public var sh6:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function juexu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 190;
			this.width = 336;
			this.elementsContent = [juexue_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __juexu_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/mainui/juexue/shanxing.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function btn_j1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j1 = temp;
			temp.name = "btn_j1";
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 0;
			temp.y = 53;
			return temp;
		}

		private function btn_j2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j2 = temp;
			temp.name = "btn_j2";
			temp.label = "2";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 37;
			temp.y = 18;
			return temp;
		}

		private function btn_j3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j3 = temp;
			temp.name = "btn_j3";
			temp.label = "3";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function btn_j4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j4 = temp;
			temp.name = "btn_j4";
			temp.label = "4";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 136;
			temp.y = 0;
			return temp;
		}

		private function btn_j5_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j5 = temp;
			temp.name = "btn_j5";
			temp.label = "5";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 183;
			temp.y = 17;
			return temp;
		}

		private function btn_j6_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_j6 = temp;
			temp.name = "btn_j6";
			temp.label = "6";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 220;
			temp.y = 53;
			return temp;
		}

		private function btn_jx_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btn_jx = temp;
			temp.name = "btn_jx";
			temp.x = 42;
			temp.y = 32;
			temp.elementsContent = [btn_j1_i(),btn_j2_i(),btn_j3_i(),btn_j4_i(),btn_j5_i(),btn_j6_i()];
			return temp;
		}

		private function juexue_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			juexue = temp;
			temp.name = "juexue";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [__juexu_Skin_UIAsset1_i(),sh_i(),btn_jx_i()];
			return temp;
		}

		private function sh1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh1 = temp;
			temp.name = "sh1";
			temp.styleName = "ui/mainui/juexue/shan_1.png";
			temp.x = 0;
			temp.y = 40;
			return temp;
		}

		private function sh2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh2 = temp;
			temp.name = "sh2";
			temp.styleName = "ui/mainui/juexue/shan_2.png";
			temp.x = 30;
			temp.y = 9;
			return temp;
		}

		private function sh3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh3 = temp;
			temp.name = "sh3";
			temp.styleName = "ui/mainui/juexue/shan_3.png";
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function sh4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh4 = temp;
			temp.name = "sh4";
			temp.styleName = "ui/mainui/juexue/shan_4.png";
			temp.x = 112;
			temp.y = 0;
			return temp;
		}

		private function sh5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh5 = temp;
			temp.name = "sh5";
			temp.styleName = "ui/mainui/juexue/shan_5.png";
			temp.x = 156;
			temp.y = 12;
			return temp;
		}

		private function sh6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			sh6 = temp;
			temp.name = "sh6";
			temp.styleName = "ui/mainui/juexue/shan_6.png";
			temp.x = 174;
			temp.y = 49;
			return temp;
		}

		private function sh_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			sh = temp;
			temp.name = "sh";
			temp.x = 3;
			temp.y = 0;
			temp.elementsContent = [sh1_i(),sh2_i(),sh3_i(),sh4_i(),sh5_i(),sh6_i()];
			return temp;
		}

	}
}