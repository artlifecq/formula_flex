package org.mokylin.skin.app.meiren
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.meiren.BtnTiaoZhan;
	import org.mokylin.skin.app.meiren.BtnTiaoZhan2;

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

		public var btn_next:feathers.controls.SkinnableContainer;

		public var grpIcon1:feathers.controls.Group;

		public var grpIcon2:feathers.controls.Group;

		public var ic1:feathers.controls.UIAsset;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var icon3:feathers.controls.UIAsset;

		public var icon4:feathers.controls.UIAsset;

		public var icon5:feathers.controls.UIAsset;

		public var icon6:feathers.controls.UIAsset;

		public var icon7:feathers.controls.UIAsset;

		public var icon8:feathers.controls.UIAsset;

		public var icon9:feathers.controls.UIAsset;

		public var lb_time:feathers.controls.Label;

		public var skinJihuo:feathers.controls.SkinnableContainer;

		public var uihead:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRenTiaoZhan()
		{
			super();
			
			this.currentState = "normal";
			this.height = 641;
			this.width = 574;
			this.elementsContent = [bgQuan_i(),grpIcon1_i(),grpIcon2_i(),btn_next_i(),skinJihuo_i(),lb_time_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
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
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btn_next_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			btn_next = temp;
			temp.name = "btn_next";
			temp.height = 59;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.BtnTiaoZhan()
			temp.skin = skin
			temp.width = 176;
			temp.x = 202;
			temp.y = 558;
			return temp;
		}

		private function grpIcon1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon1 = temp;
			temp.name = "grpIcon1";
			temp.x = 128;
			temp.y = 305;
			temp.elementsContent = [__MeiRenTiaoZhan_UIAsset1_i(),ic1_i(),uihead_i()];
			return temp;
		}

		private function grpIcon2_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon2 = temp;
			temp.name = "grpIcon2";
			temp.x = 3;
			temp.y = 42;
			temp.elementsContent = [icon5_i(),icon4_i(),icon3_i(),icon2_i(),icon1_i(),icon9_i(),icon8_i(),icon7_i(),icon6_i()];
			return temp;
		}

		private function ic1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			ic1 = temp;
			temp.name = "ic1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 130;
			temp.y = 12;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 74;
			temp.y = 1;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 0;
			temp.y = 135;
			return temp;
		}

		private function icon3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon3 = temp;
			temp.name = "icon3";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 15;
			temp.y = 284;
			return temp;
		}

		private function icon4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon4 = temp;
			temp.name = "icon4";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 109;
			temp.y = 399;
			return temp;
		}

		private function icon5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon5 = temp;
			temp.name = "icon5";
			temp.styleName = "ui/app/meiren/icon/guangqiu.png";
			temp.x = 258;
			temp.y = 449;
			return temp;
		}

		private function icon6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon6 = temp;
			temp.name = "icon6";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 407;
			temp.y = 400;
			return temp;
		}

		private function icon7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon7 = temp;
			temp.name = "icon7";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 502;
			temp.y = 284;
			return temp;
		}

		private function icon8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon8 = temp;
			temp.name = "icon8";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 515;
			temp.y = 135;
			return temp;
		}

		private function icon9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon9 = temp;
			temp.name = "icon9";
			temp.styleName = "ui/app/meiren/icon/guangqiuxiao.png";
			temp.x = 443;
			temp.y = 1;
			return temp;
		}

		private function lb_time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_time = temp;
			temp.name = "lb_time";
			temp.text = "继续挑战下一关倒计时：30";
			temp.textAlign = "center";
			temp.color = 0xFF0D0D;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 230;
			temp.x = 175;
			temp.y = 623;
			return temp;
		}

		private function skinJihuo_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinJihuo = temp;
			temp.name = "skinJihuo";
			temp.height = 59;
			var skin:StateSkin = new org.mokylin.skin.app.meiren.BtnTiaoZhan2()
			temp.skin = skin
			temp.width = 176;
			temp.x = 202;
			temp.y = 558;
			return temp;
		}

		private function uihead_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uihead = temp;
			temp.name = "uihead";
			temp.styleName = "ui/app/meiren/tiaozhan/putongjiangli.png";
			temp.x = 99;
			temp.y = -28;
			return temp;
		}

	}
}