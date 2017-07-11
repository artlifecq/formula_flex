package org.mokylin.skin.app.hunyin
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.hunyin.number.UINumberFubennum;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FuQiFuBen extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var grpIcon:feathers.controls.Group;

		public var icon1:feathers.controls.UIAsset;

		public var icon2:feathers.controls.UIAsset;

		public var numCishu:feathers.controls.UINumber;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FuQiFuBen()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__FuQiFuBen_UIAsset1_i(),__FuQiFuBen_UIAsset2_i(),__FuQiFuBen_UIAsset3_i(),grpIcon_i(),__FuQiFuBen_Group1_i(),__FuQiFuBen_UIAsset7_i(),numCishu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __FuQiFuBen_Group1_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			temp.x = 360;
			temp.y = 495;
			temp.elementsContent = [__FuQiFuBen_UIAsset4_i(),__FuQiFuBen_UIAsset5_i(),__FuQiFuBen_UIAsset6_i()];
			return temp;
		}

		private function __FuQiFuBen_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __FuQiFuBen_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/hunyin/fuben_bg.jpg";
			temp.x = 23;
			temp.y = 87;
			return temp;
		}

		private function __FuQiFuBen_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/hunyin/fuqifuben.png";
			temp.x = 434;
			temp.y = 14;
			return temp;
		}

		private function __FuQiFuBen_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_1.png";
			temp.x = 0;
			temp.y = 4;
			return temp;
		}

		private function __FuQiFuBen_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/wenshi/huawen_2.png";
			temp.x = 172;
			temp.y = 4;
			return temp;
		}

		private function __FuQiFuBen_UIAsset6_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/fubendiaoluogailu.png";
			temp.x = 72;
			temp.y = 1;
			return temp;
		}

		private function __FuQiFuBen_UIAsset7_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/hunyin/shengyutiaozhancishu.png";
			temp.x = 49;
			temp.y = 530;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 601;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongPanelbg1()
			temp.skin = skin
			temp.width = 956;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function grpIcon_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			grpIcon = temp;
			temp.name = "grpIcon";
			temp.x = 420;
			temp.y = 522;
			temp.elementsContent = [icon1_i(),icon2_i()];
			return temp;
		}

		private function icon1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon1 = temp;
			temp.name = "icon1";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function icon2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			icon2 = temp;
			temp.name = "icon2";
			temp.styleName = "ui/common/grid/normal/48.png";
			temp.x = 61;
			temp.y = 0;
			return temp;
		}

		private function numCishu_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numCishu = temp;
			temp.name = "numCishu";
			temp.gap = -6;
			temp.height = 18;
			temp.label = "10";
			temp.styleClass = org.mokylin.skin.app.hunyin.number.UINumberFubennum;
			temp.width = 50;
			temp.x = 171;
			temp.y = 528;
			return temp;
		}

	}
}