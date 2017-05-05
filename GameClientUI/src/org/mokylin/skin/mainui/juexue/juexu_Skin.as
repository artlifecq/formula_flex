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

		public var bg7:feathers.controls.UIAsset;

		public var bg_jineng:feathers.controls.Group;

		public var btn_1:feathers.controls.Button;

		public var btn_2:feathers.controls.Button;

		public var btn_3:feathers.controls.Button;

		public var btn_4:feathers.controls.Button;

		public var btn_5:feathers.controls.Button;

		public var btn_6:feathers.controls.Button;

		public var btn_7:feathers.controls.Button;

		public var grp_btn:feathers.controls.Group;

		public var grp_mc:feathers.controls.Group;

		public var juexue:feathers.controls.Group;

		public var skill_1:feathers.controls.UIAsset;

		public var skill_2:feathers.controls.UIAsset;

		public var skill_3:feathers.controls.UIAsset;

		public var skill_4:feathers.controls.UIAsset;

		public var skill_5:feathers.controls.UIAsset;

		public var skill_6:feathers.controls.UIAsset;

		public var skill_7:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function juexu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 180;
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
			temp.y = 15;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/mainui/juexue/shan_2.png";
			temp.x = 16;
			temp.y = -9;
			return temp;
		}

		private function bg3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg3 = temp;
			temp.name = "bg3";
			temp.styleName = "ui/mainui/juexue/shan_3.png";
			temp.x = 42;
			temp.y = -23;
			return temp;
		}

		private function bg4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg4 = temp;
			temp.name = "bg4";
			temp.styleName = "ui/mainui/juexue/shan_4.png";
			temp.x = 83;
			temp.y = -24;
			return temp;
		}

		private function bg5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg5 = temp;
			temp.name = "bg5";
			temp.styleName = "ui/mainui/juexue/shan_5.png";
			temp.x = 128;
			temp.y = -22;
			return temp;
		}

		private function bg6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg6 = temp;
			temp.name = "bg6";
			temp.styleName = "ui/mainui/juexue/shan_6.png";
			temp.x = 155;
			temp.y = -8;
			return temp;
		}

		private function bg7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg7 = temp;
			temp.name = "bg7";
			temp.styleName = "ui/mainui/juexue/shan_7.png";
			temp.x = 170;
			temp.y = 17;
			return temp;
		}

		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/mainui/juexue/shanxing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg_jineng_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			bg_jineng = temp;
			temp.name = "bg_jineng";
			temp.x = 22;
			temp.y = 37;
			temp.elementsContent = [bg1_i(),bg2_i(),bg3_i(),bg4_i(),bg5_i(),bg6_i(),bg7_i()];
			return temp;
		}

		private function btn_1_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_1 = temp;
			temp.name = "btn_1";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 0;
			temp.y = 70;
			return temp;
		}

		private function btn_2_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_2 = temp;
			temp.name = "btn_2";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 28;
			temp.y = 36;
			return temp;
		}

		private function btn_3_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_3 = temp;
			temp.name = "btn_3";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 67;
			temp.y = 10;
			return temp;
		}

		private function btn_4_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_4 = temp;
			temp.name = "btn_4";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 113;
			temp.y = 0;
			return temp;
		}

		private function btn_5_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_5 = temp;
			temp.name = "btn_5";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 162;
			temp.y = 7;
			return temp;
		}

		private function btn_6_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_6 = temp;
			temp.name = "btn_6";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 205;
			temp.y = 33;
			return temp;
		}

		private function btn_7_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btn_7 = temp;
			temp.name = "btn_7";
			temp.height = 30;
			temp.styleClass = org.mokylin.skin.mainui.juexue.button.ButtonJuexue_bt;
			temp.width = 30;
			temp.x = 233;
			temp.y = 69;
			return temp;
		}

		private function grp_btn_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_btn = temp;
			temp.name = "grp_btn";
			temp.x = 34;
			temp.y = 18;
			temp.elementsContent = [btn_1_i(),btn_2_i(),btn_3_i(),btn_4_i(),btn_5_i(),btn_6_i(),btn_7_i()];
			return temp;
		}

		private function grp_mc_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grp_mc = temp;
			temp.name = "grp_mc";
			temp.x = 34;
			temp.y = 18;
			temp.elementsContent = [skill_1_i(),skill_2_i(),skill_3_i(),skill_4_i(),skill_5_i(),skill_6_i(),skill_7_i()];
			return temp;
		}

		private function juexue_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			juexue = temp;
			temp.name = "juexue";
			temp.height = 180;
			temp.x = 0;
			temp.y = 0;
			temp.elementsContent = [bg_i(),bg_jineng_i(),grp_mc_i(),grp_btn_i()];
			return temp;
		}

		private function skill_1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_1 = temp;
			temp.name = "skill_1";
			temp.styleName = "ui/mainui/juexue/icon/feishengjiutian.png";
			temp.x = 0;
			temp.y = 70;
			return temp;
		}

		private function skill_2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_2 = temp;
			temp.name = "skill_2";
			temp.styleName = "ui/mainui/juexue/icon/wanghunbeige.png";
			temp.x = 28;
			temp.y = 36;
			return temp;
		}

		private function skill_3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_3 = temp;
			temp.name = "skill_3";
			temp.styleName = "ui/mainui/juexue/icon/binfengsudong.png";
			temp.x = 67;
			temp.y = 10;
			return temp;
		}

		private function skill_4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_4 = temp;
			temp.name = "skill_4";
			temp.styleName = "ui/mainui/juexue/icon/renzheshengui.png";
			temp.x = 113;
			temp.y = 0;
			return temp;
		}

		private function skill_5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_5 = temp;
			temp.name = "skill_5";
			temp.styleName = "ui/mainui/juexue/icon/shikongliexi.png";
			temp.x = 162;
			temp.y = 7;
			return temp;
		}

		private function skill_6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_6 = temp;
			temp.name = "skill_6";
			temp.styleName = "ui/mainui/juexue/icon/canglongzhili.png";
			temp.x = 205;
			temp.y = 33;
			return temp;
		}

		private function skill_7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			skill_7 = temp;
			temp.name = "skill_7";
			temp.styleName = "ui/mainui/juexue/icon/shengshengbuxi.png";
			temp.x = 232;
			temp.y = 69;
			return temp;
		}

	}
}