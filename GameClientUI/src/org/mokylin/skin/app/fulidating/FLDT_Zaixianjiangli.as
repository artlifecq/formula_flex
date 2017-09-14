package org.mokylin.skin.app.fulidating
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.app.fulidating.number.UINumberShuzi;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class FLDT_Zaixianjiangli extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var Time:feathers.controls.UINumber;

		public var itemContainer:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function FLDT_Zaixianjiangli()
		{
			super();
			
			this.currentState = "normal";
			this.width = 756;
			this.elementsContent = [__FLDT_Zaixianjiangli_UIAsset1_i(),Time_i(),itemContainer_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function Time_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			Time = temp;
			temp.name = "Time";
			temp.gap = -2;
			temp.height = 25;
			temp.label = "00x05x04";
			temp.styleClass = org.mokylin.skin.app.fulidating.number.UINumberShuzi;
			temp.width = 166;
			temp.x = 590;
			temp.y = 81;
			return temp;
		}

		private function __FLDT_Zaixianjiangli_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/big_bg/fulidating/zaixianjaingli.jpg";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function itemContainer_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			itemContainer = temp;
			temp.name = "itemContainer";
			temp.height = 385;
			temp.width = 746;
			temp.x = 2;
			temp.y = 117;
			return temp;
		}

	}
}