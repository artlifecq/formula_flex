package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Button;
	import feathers.controls.Label;
	import feathers.controls.ProgressBar;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
	import org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
	import org.mokylin.skin.app.zhanchang.dianfengduijue.Pro_duanwei;
	import org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber4;
	import org.mokylin.skin.component.button.ButtonSkin_putong2;
	import org.mokylin.skin.component.button.ButtonSkin_shuoming2;

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

		public var btnMsg:feathers.controls.Button;

		public var btnOpen:feathers.controls.Button;

		public var btnShengwang:feathers.controls.Button;

		public var icon:feathers.controls.UIAsset;

		public var iconName:feathers.controls.UIAsset;

		public var lbDuanwei:feathers.controls.Label;

		public var lbShengwang:feathers.controls.Label;

		public var numCishu:feathers.controls.UINumber;

		public var numShengwang:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function DianFeng_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__DianFeng_Skin_UIAsset2_i(),icon_i(),iconName_i(),__DianFeng_Skin_UIAsset3_i(),Pro_duanwei_i(),lbDuanwei_i(),btnChakan_i(),btnOpen_i(),__DianFeng_Skin_UIAsset4_i(),__DianFeng_Skin_UIAsset5_i(),numCishu_i(),numShengwang_i(),__DianFeng_Skin_UIAsset6_i(),__DianFeng_Skin_UIAsset7_i(),lbShengwang_i(),btnShengwang_i(),btnMsg_i()];
			
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
			temp.x = 136;
			temp.y = 114;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/dianfeng_bg.jpg";
			temp.x = 19;
			temp.y = 74;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/jindutiaodi.png";
			temp.width = 199;
			temp.x = 118;
			temp.y = 111;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/cishu.png";
			temp.x = 217;
			temp.y = 530;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/dianfengduijue/shengwang.png";
			temp.x = 197;
			temp.y = 554;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 88;
			temp.x = 597;
			temp.y = 541;
			return temp;
		}

		private function __DianFeng_Skin_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 602;
			temp.y = 539;
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
			temp.x = 127;
			temp.y = 141;
			return temp;
		}

		private function btnMsg_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnMsg = temp;
			temp.name = "btnMsg";
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_shuoming2;
			temp.x = 902;
			temp.y = 79;
			return temp;
		}

		private function btnOpen_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnOpen = temp;
			temp.name = "btnOpen";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonKaiqi;
			temp.x = 359;
			temp.y = 516;
			return temp;
		}

		private function btnShengwang_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnShengwang = temp;
			temp.name = "btnShengwang";
			temp.styleClass = org.mokylin.skin.app.zhanchang.button.ButtonShengwangbtn;
			temp.x = 693;
			temp.y = 510;
			return temp;
		}

		private function iconName_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconName = temp;
			temp.name = "iconName";
			temp.styleName = "ui/app/zhanchang/icon/name/1001.png";
			temp.x = 39;
			temp.y = 156;
			return temp;
		}

		private function icon_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon = temp;
			temp.name = "icon";
			temp.styleName = "ui/app/zhanchang/icon/huangjinyijie.png";
			temp.x = 20;
			temp.y = 89;
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
			temp.x = 167;
			temp.y = 114;
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
			temp.x = 630;
			temp.y = 544;
			return temp;
		}

		private function numCishu_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numCishu = temp;
			temp.name = "numCishu";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "1168";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber4;
			temp.width = 63;
			temp.x = 316;
			temp.y = 532;
			return temp;
		}

		private function numShengwang_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numShengwang = temp;
			temp.name = "numShengwang";
			temp.gap = -4;
			temp.height = 25;
			temp.label = "1168";
			temp.styleClass = org.mokylin.skin.app.zhanchang.uinumber.UINumberNumber4;
			temp.width = 63;
			temp.x = 305;
			temp.y = 555;
			return temp;
		}

	}
}