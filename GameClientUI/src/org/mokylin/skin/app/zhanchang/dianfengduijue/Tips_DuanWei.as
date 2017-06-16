package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Tips_DuanWei extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var gNext:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var lbCurrent:feathers.controls.Label;

		public var lbDangqian:feathers.controls.Label;

		public var lbDangqian1:feathers.controls.Label;

		public var lbNext:feathers.controls.Label;

		public var lbNext2:feathers.controls.Label;

		public var lbXiaJie:feathers.controls.Label;

		public var line1:feathers.controls.UIAsset;

		public var uiIcon:feathers.controls.UIAsset;

		public var uiIcon2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Tips_DuanWei()
		{
			super();
			
			this.currentState = "normal";
			this.height = 278;
			this.width = 298;
			this.elementsContent = [bg_i(),lbDangqian_i(),lbCurrent_i(),lbDangqian1_i(),uiIcon_i(),lbXiaJie_i(),line1_i(),icon1_i(),gNext_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.height = 278;
			temp.styleName = "ui/common/tips/tips_2.png";
			temp.width = 298;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function gNext_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			gNext = temp;
			temp.name = "gNext";
			temp.x = 12;
			temp.y = 174;
			temp.elementsContent = [lbNext_i(),uiIcon2_i(),lbNext2_i(),icon2_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 12;
			temp.y = 88;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/36.png";
			temp.x = 0;
			temp.y = 50;
			return temp;
		}

		private function lbCurrent_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCurrent = temp;
			temp.name = "lbCurrent";
			temp.text = "青铜一阶";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 45;
			temp.y = 40;
			return temp;
		}

		private function lbDangqian1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDangqian1 = temp;
			temp.name = "lbDangqian1";
			temp.text = "每日段位奖励：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 12;
			temp.y = 67;
			return temp;
		}

		private function lbDangqian_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDangqian = temp;
			temp.name = "lbDangqian";
			temp.text = "【当前段位】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 14;
			return temp;
		}

		private function lbNext2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNext2 = temp;
			temp.name = "lbNext2";
			temp.text = "每日段位奖励：";
			temp.color = 0x8B8D7B;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 0;
			temp.y = 30;
			return temp;
		}

		private function lbNext_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNext = temp;
			temp.name = "lbNext";
			temp.text = "青铜二阶";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 33;
			temp.y = 3;
			return temp;
		}

		private function lbXiaJie_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbXiaJie = temp;
			temp.name = "lbXiaJie";
			temp.text = "【下一阶段位】";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.x = 9;
			temp.y = 151;
			return temp;
		}

		private function line1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			line1 = temp;
			temp.name = "line1";
			temp.styleName = "ui/common/tips/tips_1fengexian.png";
			temp.width = 267;
			temp.x = 15;
			temp.y = 140;
			return temp;
		}

		private function uiIcon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon2 = temp;
			temp.name = "uiIcon2";
			temp.styleName = "ui/app/zhanchang/icon/1001_24.png";
			temp.x = 3;
			temp.y = 0;
			return temp;
		}

		private function uiIcon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiIcon = temp;
			temp.name = "uiIcon";
			temp.styleName = "ui/app/zhanchang/icon/1001_24.png";
			temp.x = 15;
			temp.y = 37;
			return temp;
		}

	}
}