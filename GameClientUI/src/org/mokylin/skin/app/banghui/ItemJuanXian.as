package org.mokylin.skin.app.banghui
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Label;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.controls.UINumber;
	import org.mokylin.skin.common.ItemBg;
	import org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class ItemJuanXian extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var lbRolenName:feathers.controls.Label;

		public var lbZhanli:feathers.controls.Label;

		public var numList:feathers.controls.UINumber;

		public var numList2:feathers.controls.Label;

		public var uiFirt:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function ItemJuanXian()
		{
			super();
			
			this.currentState = "normal";
			this.height = 36;
			this.width = 254;
			this.elementsContent = [bg_i(),uiFirt_i(),numList2_i(),numList_i(),lbRolenName_i(),lbZhanli_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 36;
			var skin:StateSkin = new org.mokylin.skin.common.ItemBg()
			temp.skin = skin
			temp.width = 254;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function lbRolenName_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbRolenName = temp;
			temp.name = "lbRolenName";
			temp.text = "玩家名字六字";
			temp.color = 0x6BCC08;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 95;
			temp.x = 67;
			temp.y = 10;
			return temp;
		}

		private function lbZhanli_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lbZhanli = temp;
			temp.name = "lbZhanli";
			temp.text = "999999999";
			temp.textAlign = "left";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 77;
			temp.x = 175;
			temp.y = 10;
			return temp;
		}

		private function numList2_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			numList2 = temp;
			temp.name = "numList2";
			temp.text = "4";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.x = 25;
			temp.y = 11;
			return temp;
		}

		private function numList_i():feathers.controls.UINumber
		{
			var temp:feathers.controls.UINumber = new feathers.controls.UINumber();
			numList = temp;
			temp.name = "numList";
			temp.gap = 0;
			temp.height = 25;
			temp.label = "1";
			temp.styleClass = org.mokylin.skin.component.uinumber.UINumberSkin_zhandouli_yellow2;
			temp.width = 33;
			temp.x = 20;
			temp.y = 2;
			return temp;
		}

		private function uiFirt_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiFirt = temp;
			temp.name = "uiFirt";
			temp.styleName = "ui/app/banghui/huawen.png";
			temp.x = 0;
			temp.y = 14;
			return temp;
		}

	}
}