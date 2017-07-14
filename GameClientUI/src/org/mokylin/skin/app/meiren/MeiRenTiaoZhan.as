package org.mokylin.skin.app.meiren
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.BtnTiaoZhan;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRenTiaoZhan extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bgQuan:feathers.controls.UIAsset;

		public var grpIcon1:feathers.controls.Group;

		public var grpIcon2:feathers.controls.Group;

		public var ic1:feathers.controls.UIAsset;

		public var ic2:feathers.controls.UIAsset;

		public var ic3:feathers.controls.UIAsset;

		public var ic4:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var icon7:feathers.controls.UIAsset;

		public var icon8:feathers.controls.UIAsset;

		public var icon9:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRenTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 553;
			this.width = 529;
			this.elementsContent = [bgQuan_i(),grpIcon1_i(),grpIcon2_i(),__MeiRenTiaoZhan_SkinnableContainer1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MeiRenTiaoZhan_SkinnableContainer1_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			temp.height = 59;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.BtnTiaoZhan()
			temp.skin = skin
			temp.width = 176;
			temp.x = 176;
			temp.y = 494;
			return temp;
		}

		private function __MeiRenTiaoZhan_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/meiren/tiaozhan/jianglibeijing.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bgQuan_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bgQuan = temp;
			temp.name = "bgQuan";
			temp.styleName = "ui/app/meiren/tiaozhan/xiaoguodi.png";
			temp.x = 18;
			temp.y = 0;
			return temp;
		}

		private function grpIcon1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon1 = temp;
			temp.name = "grpIcon1";
			temp.x = 102;
			temp.y = 323;
			temp.elementsContent = [__MeiRenTiaoZhan_UIAsset1_i(),ic1_i(),ic2_i(),ic3_i(),ic4_i()];
			return temp;
		}

		private function grpIcon2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon2 = temp;
			temp.name = "grpIcon2";
			temp.x = 0;
			temp.y = 106;
			temp.elementsContent = [icon1_i(),icon2_i(),icon3_i(),icon4_i(),icon5_i(),icon6_i(),icon7_i(),icon8_i(),icon9_i()];
			return temp;
		}

		private function ic1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ic1 = temp;
			temp.name = "ic1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 47;
			temp.y = 12;
			return temp;
		}

		private function ic2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ic2 = temp;
			temp.name = "ic2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 107;
			temp.y = 12;
			return temp;
		}

		private function ic3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ic3 = temp;
			temp.name = "ic3";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 168;
			temp.y = 12;
			return temp;
		}

		private function ic4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ic4 = temp;
			temp.name = "ic4";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 228;
			temp.y = 12;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/app/meiren/icon/guangqiu.png";
			temp.x = 231;
			temp.y = 315;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 92;
			temp.y = 305;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 15;
			temp.y = 216;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 0;
			temp.y = 104;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 431;
			temp.y = 0;
			return temp;
		}

		private function icon7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon7 = temp;
			temp.name = "icon7";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 499;
			temp.y = 104;
			return temp;
		}

		private function icon8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon8 = temp;
			temp.name = "icon8";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 483;
			temp.y = 216;
			return temp;
		}

		private function icon9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon9 = temp;
			temp.name = "icon9";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 417;
			temp.y = 304;
			return temp;
		}

	}
}