package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Group;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
	import org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.Pro_duanwei;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class DianFeng_Skin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Pro_duanwei:feathers.controls.ProgressBar;

		public var btnChakan:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnShengwang:feathers.controls.Button;

		public var grpTips:feathers.controls.Group;

		public var icoSw:feathers.controls.UIAsset;

		public var icon:feathers.controls.UIAsset;

		public var iconName:feathers.controls.UIAsset;

		public var lbCiShu:feathers.controls.Label;

		public var lbDuanwei:feathers.controls.Label;

		public var lbSheng:feathers.controls.Label;

		public var lbShengwang:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DianFeng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [__DianFeng_Skin_UIAsset2_i(),icon_i(),iconName_i(),__DianFeng_Skin_UIAsset3_i(),Pro_duanwei_i(),lbDuanwei_i(),btnChakan_i(),btnOpen_i(),__DianFeng_Skin_UIAsset4_i(),__DianFeng_Skin_UIAsset5_i(),lbCiShu_i(),lbSheng_i(),__DianFeng_Skin_UIAsset6_i(),icoSw_i(),lbShengwang_i(),btnShengwang_i(),grpTips_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Pro_duanwei_i():feathers.controls.ProgressBar
		{
			var temp:feathers.controls.ProgressBar = new feathers.controls.ProgressBar();
			Pro_duanwei = temp;
			temp.name = "Pro_duanwei";
			temp.styleClass = org.mokylin.skin.app.zhanchang.dianfengduijue.Pro_duanwei;
			temp.value = 60;
			temp.x = 140;
			temp.y = 127;
			return temp;
		}

		private function __DianFeng_Skin_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "等级需求:<font color='#5DBD37'>50级</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 7;
			temp.y = 15;
			return temp;
		}

		private function __DianFeng_Skin_Label2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.htmlText = "开启时间:周一、三、四、六、日<font color='#5DBD37'>21:00-21:30</font>";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 321;
			temp.x = 7;
			temp.y = 34;
			return temp;
		}

		private function __DianFeng_Skin_Label3_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 49;
			temp.htmlText = "战场规则:1.每日前十场可获得<font color='#5DBD37'>声望奖励</font><br>         2.每日获取积分决定段位，每日24点刷新段位奖励";
			temp.leading = 7;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 380;
			temp.x = 7;
			temp.y = 53;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/dianfeng_bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/jindutiaodi.png";
			temp.width = 199;
			temp.x = 122;
			temp.y = 124;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/cishu.png";
			temp.x = 221;
			temp.y = 543;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/shengwang.png";
			temp.x = 201;
			temp.y = 567;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 88;
			temp.x = 601;
			temp.y = 554;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 122;
			temp.styleName = "ui/app/zhanchang/dianfengduijue/touban.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function btnChakan_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnChakan = temp;
			temp.name = "btnChakan";
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.label = "排行奖励";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xCFC6AE;
			temp.width = 80;
			temp.x = 131;
			temp.y = 154;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
			temp.x = 363;
			temp.y = 529;
			return temp;
		}

		private function btnShengwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengwang = temp;
			temp.name = "btnShengwang";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
			temp.x = 697;
			temp.y = 523;
			return temp;
		}

		private function grpTips_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpTips = temp;
			temp.name = "grpTips";
			temp.x = 545;
			temp.y = 90;
			temp.elementsContent = [__DianFeng_Skin_UIAsset7_i(),__DianFeng_Skin_Label1_i(),__DianFeng_Skin_Label2_i(),__DianFeng_Skin_Label3_i()];
			return temp;
		}

		private function icoSw_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icoSw = temp;
			temp.name = "icoSw";
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 606;
			temp.y = 552;
			return temp;
		}

		private function iconName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconName = temp;
			temp.name = "iconName";
			temp.styleName = "ui/app/zhanchang/icon/name/1001.png";
			temp.x = 43;
			temp.y = 169;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/zhanchang/icon/1001_max.png";
			temp.x = 24;
			temp.y = 102;
			return temp;
		}

		private function lbCiShu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbCiShu = temp;
			temp.name = "lbCiShu";
			temp.text = "1/3";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 317;
			temp.y = 546;
			return temp;
		}

		private function lbDuanwei_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbDuanwei = temp;
			temp.name = "lbDuanwei";
			temp.text = "135/160";
			temp.textAlign = "center";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 101;
			temp.x = 171;
			temp.y = 127;
			return temp;
		}

		private function lbSheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbSheng = temp;
			temp.name = "lbSheng";
			temp.text = "4545110";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["labelFilterBlack"];
			temp.width = 80;
			temp.x = 301;
			temp.y = 568;
			return temp;
		}

		private function lbShengwang_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShengwang = temp;
			temp.name = "lbShengwang";
			temp.text = "1000";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 634;
			temp.y = 557;
			return temp;
		}

	}
}