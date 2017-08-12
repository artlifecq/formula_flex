package org.mokylin.skin.app.zhanchang.jingjichang
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.List;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
	import org.mokylin.skin.component.button.ButtonSkin_close2;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.list.ListSkin1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JingJiChang3 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var ListItem:feathers.controls.List;

		public var btnBack:feathers.controls.Button;

		public var btnOK:feathers.controls.Button;

		public var icon1:feathers.controls.UIAsset;

		public var imgMing:feathers.controls.UIAsset;

		public var imgYiwai:feathers.controls.UIAsset;

		public var labReward:feathers.controls.Label;

		public var lbHuosheng:feathers.controls.Label;

		public var lbRongyu:feathers.controls.Label;

		public var lbShibai:feathers.controls.Label;

		public var numZhanli:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JingJiChang3()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__JingJiChang3_UIAsset2_i(),labReward_i(),__JingJiChang3_UIAsset3_i(),__JingJiChang3_UIAsset4_i(),ListItem_i(),__JingJiChang3_UIAsset5_i(),__JingJiChang3_UIAsset6_i(),__JingJiChang3_UIAsset7_i(),__JingJiChang3_UIAsset8_i(),__JingJiChang3_UIAsset9_i(),__JingJiChang3_UIAsset10_i(),__JingJiChang3_UIAsset11_i(),__JingJiChang3_UIAsset12_i(),imgYiwai_i(),imgMing_i(),numZhanli_i(),__JingJiChang3_Label1_i(),lbHuosheng_i(),lbShibai_i(),lbRongyu_i(),icon1_i(),btnBack_i(),btnOK_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function ListItem_i():feathers.controls.List
		{
			var temp:feathers.controls.List = new feathers.controls.List();
			ListItem = temp;
			temp.name = "ListItem";
			temp.height = 456;
			temp.styleClass = org.mokylin.skin.component.list.ListSkin1;
			temp.width = 503;
			temp.x = 34;
			temp.y = 126;
			return temp;
		}

		private function __JingJiChang3_Label1_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			temp.height = 53;
			temp.htmlText = "    领奖排名是指每天<font color='#00ff33'>24:00</font>刷新奖励是您的排名，可能与您的当前排名不同，排行榜奖励<font color='#00ff33'>每天只能领取一次</font>";
			temp.leading = 6;
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 350;
			temp.x = 572;
			temp.y = 243;
			return temp;
		}

		private function __JingJiChang3_UIAsset10_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/jinrizhankuang.png";
			temp.x = 573;
			temp.y = 298;
			return temp;
		}

		private function __JingJiChang3_UIAsset11_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/pomo.png";
			temp.x = 560;
			temp.y = 417;
			return temp;
		}

		private function __JingJiChang3_UIAsset12_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/paimingjiangli.png";
			temp.x = 573;
			temp.y = 416;
			return temp;
		}

		private function __JingJiChang3_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/bg2.jpg";
			temp.x = 22;
			temp.y = 87;
			return temp;
		}

		private function __JingJiChang3_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/paimingjiangliyulan.png";
			temp.x = 166;
			temp.y = 88;
			return temp;
		}

		private function __JingJiChang3_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/wodepaimingjiangli.png";
			temp.x = 622;
			temp.y = 88;
			return temp;
		}

		private function __JingJiChang3_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/pomo.png";
			temp.x = 560;
			temp.y = 131;
			return temp;
		}

		private function __JingJiChang3_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/wodepaiming.png";
			temp.x = 573;
			temp.y = 130;
			return temp;
		}

		private function __JingJiChang3_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/pomo.png";
			temp.x = 560;
			temp.y = 199;
			return temp;
		}

		private function __JingJiChang3_UIAsset8_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/lingjiangpaiming.png";
			temp.x = 573;
			temp.y = 198;
			return temp;
		}

		private function __JingJiChang3_UIAsset9_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jingjichang/pomo.png";
			temp.x = 560;
			temp.y = 299;
			return temp;
		}

		private function btnBack_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnBack = temp;
			temp.name = "btnBack";
			temp.height = 21;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close2;
			temp.width = 21;
			temp.x = 910;
			temp.y = 98;
			return temp;
		}

		private function btnOK_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOK = temp;
			temp.name = "btnOK";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.label = "领取奖励";
			temp.fontSize = 16;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_putong2;
			temp.color = 0xEAEABC;
			temp.width = 100;
			temp.x = 695;
			temp.y = 528;
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/64.png";
			temp.x = 563;
			temp.y = 453;
			return temp;
		}

		private function imgMing_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgMing = temp;
			temp.name = "imgMing";
			temp.styleName = "ui/app/zhanchang/jingjichang/ming2.png";
			temp.x = 742;
			temp.y = 164;
			return temp;
		}

		private function imgYiwai_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			imgYiwai = temp;
			temp.name = "imgYiwai";
			temp.styleName = "ui/app/zhanchang/jingjichang/yiwai.png";
			temp.x = 769;
			temp.y = 164;
			return temp;
		}

		private function labReward_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			labReward = temp;
			temp.name = "labReward";
			temp.text = "可领取奖励";
			temp.color = 0x00FF33;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 709;
			temp.y = 565;
			return temp;
		}

		private function lbHuosheng_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbHuosheng = temp;
			temp.name = "lbHuosheng";
			temp.text = "获胜：$";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 594;
			temp.y = 339;
			return temp;
		}

		private function lbRongyu_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRongyu = temp;
			temp.name = "lbRongyu";
			temp.text = "获得荣誉：$";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 594;
			temp.y = 381;
			return temp;
		}

		private function lbShibai_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbShibai = temp;
			temp.name = "lbShibai";
			temp.text = "失败：$";
			temp.color = 0xFFEA00;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 163;
			temp.x = 594;
			temp.y = 360;
			return temp;
		}

		private function numZhanli_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numZhanli = temp;
			temp.name = "numZhanli";
			temp.gap = -2;
			temp.height = 25;
			temp.label = "2000";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber3;
			temp.width = 76;
			temp.x = 669;
			temp.y = 164;
			return temp;
		}

	}
}