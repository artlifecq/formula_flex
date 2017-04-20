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
		public var bg:feathers.controls.UIAsset;

		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;

		public var bg3:feathers.controls.UIAsset;

		public var bg4:feathers.controls.UIAsset;

		public var bg5:feathers.controls.UIAsset;

		public var bg6:feathers.controls.UIAsset;

		public var bg_jineng:feathers.controls.Group;

		public var btn_jineng:feathers.controls.Group;

		public var btn_jineng1:feathers.controls.Button;

		public var btn_jineng2:feathers.controls.Button;

		public var btn_jineng3:feathers.controls.Button;

		public var btn_jineng4:feathers.controls.Button;

		public var btn_jineng5:feathers.controls.Button;

		public var btn_jineng6:feathers.controls.Button;

		public var juexue:feathers.controls.Group;


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
		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/mainui/juexue/shan_1.png";
			temp.x = 0;
			temp.y = 40;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/mainui/juexue/shan_2.png";
			temp.x = 30;
			temp.y = 9;
			return temp;
		}

		private function bg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg3 = temp;
			temp.name = "bg3";
			temp.styleName = "ui/mainui/juexue/shan_3.png";
			temp.x = 69;
			temp.y = 0;
			return temp;
		}

		private function bg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg4 = temp;
			temp.name = "bg4";
			temp.styleName = "ui/mainui/juexue/shan_4.png";
			temp.x = 112;
			temp.y = 0;
			return temp;
		}

		private function bg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg5 = temp;
			temp.name = "bg5";
			temp.styleName = "ui/mainui/juexue/shan_5.png";
			temp.x = 156;
			temp.y = 12;
			return temp;
		}

		private function bg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg6 = temp;
			temp.name = "bg6";
			temp.styleName = "ui/mainui/juexue/shan_6.png";
			temp.x = 174;
			temp.y = 49;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/mainui/juexue/shanxing.png";
			temp.x = 0;
			temp.y = 3;
			return temp;
		}

		private function bg_jineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bg_jineng = temp;
			temp.name = "bg_jineng";
			temp.x = 3;
			temp.y = 0;
			temp.elementsContent = [bg1_i(),bg2_i(),bg3_i(),bg4_i(),bg5_i(),bg6_i()];
			return temp;
		}

		private function btn_jineng1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng1 = temp;
			temp.name = "btn_jineng1";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 0;
			temp.y = 53;
			return temp;
		}

		private function btn_jineng2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng2 = temp;
			temp.name = "btn_jineng2";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 37;
			temp.y = 18;
			return temp;
		}

		private function btn_jineng3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng3 = temp;
			temp.name = "btn_jineng3";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 86;
			temp.y = 0;
			return temp;
		}

		private function btn_jineng4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng4 = temp;
			temp.name = "btn_jineng4";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 136;
			temp.y = 0;
			return temp;
		}

		private function btn_jineng5_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng5 = temp;
			temp.name = "btn_jineng5";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 183;
			temp.y = 17;
			return temp;
		}

		private function btn_jineng6_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_jineng6 = temp;
			temp.name = "btn_jineng6";
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.x = 220;
			temp.y = 53;
			return temp;
		}

		private function btn_jineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			btn_jineng = temp;
			temp.name = "btn_jineng";
			temp.x = 42;
			temp.y = 32;
			temp.elementsContent = [btn_jineng1_i(),btn_jineng2_i(),btn_jineng3_i(),btn_jineng4_i(),btn_jineng5_i(),btn_jineng6_i()];
			return temp;
		}

		private function juexue_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			juexue = temp;
			temp.name = "juexue";
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_i(),bg_jineng_i(),btn_jineng_i()];
			return temp;
		}

	}
}