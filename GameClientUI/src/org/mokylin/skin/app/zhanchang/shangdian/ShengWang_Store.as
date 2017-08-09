package org.mokylin.skin.app.zhanchang.shangdian
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.Flip1_Skin;
	import org.mokylin.skin.common.TongYongPanelbg1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ShengWang_Store extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var iconSw:feathers.controls.UIAsset;

		public var lbNum:feathers.controls.Label;

		public var skinFlip:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ShengWang_Store()
		{
			super();
			
			this.currentState = "normal";
			this.height = 601;
			this.width = 956;
			this.elementsContent = [bg_i(),__ShengWang_Store_UIAsset1_i(),__ShengWang_Store_UIAsset2_i(),__ShengWang_Store_UIAsset3_i(),__ShengWang_Store_UIAsset4_i(),iconSw_i(),lbNum_i(),__ShengWang_Store_UIAsset5_i(),skinFlip_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __ShengWang_Store_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 512;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 18;
			temp.y = 82;
			return temp;
		}

		private function __ShengWang_Store_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/zhanchang/bg3.jpg";
			temp.x = 23;
			temp.y = 88;
			return temp;
		}

		private function __ShengWang_Store_UIAsset3_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.touchable = false;
			temp.touchGroup = true;
			temp.styleName = "ui/app/zhanchang/shangcheng/shengwang_title.png";
			temp.x = 444;
			temp.y = 20;
			return temp;
		}

		private function __ShengWang_Store_UIAsset4_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/background/neikuang.png";
			temp.width = 88;
			temp.x = 788;
			temp.y = 560;
			return temp;
		}

		private function __ShengWang_Store_UIAsset5_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/zhanchang/jiucengyaota/shengwangzhi.png";
			temp.x = 733;
			temp.y = 562;
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

		private function iconSw_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			iconSw = temp;
			temp.name = "iconSw";
			temp.styleName = "ui/common/tubiao/shengwang.png";
			temp.x = 793;
			temp.y = 558;
			return temp;
		}

		private function lbNum_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbNum = temp;
			temp.name = "lbNum";
			temp.text = "1000";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 50;
			temp.x = 821;
			temp.y = 563;
			return temp;
		}

		private function skinFlip_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			skinFlip = temp;
			temp.name = "skinFlip";
			temp.height = 25;
			var skin:StateSkin = new org.mokylin.skin.common.Flip1_Skin()
			temp.skin = skin
			temp.width = 122;
			temp.x = 417;
			temp.y = 558;
			return temp;
		}

	}
}