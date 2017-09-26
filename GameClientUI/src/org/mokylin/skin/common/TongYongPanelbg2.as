package org.mokylin.skin.common
{
	import feathers.controls.Button;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongHead2;
	import org.mokylin.skin.component.button.ButtonSkin_close;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TongYongPanelbg2 extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.SkinnableContainer;

		public var btnClose:feathers.controls.Button;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TongYongPanelbg2()
		{
			super();
			
			this.currentState = "normal";
			this.width = 675;
			this.elementsContent = [bg_i(),__TongYongPanelbg2_UIAsset1_i(),btnClose_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TongYongPanelbg2_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.styleName = "ui/common/background/tongyongV2_di.png";
			temp.top = 82;
			temp.width = 681;
			temp.x = -3;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 82;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongHead2()
			temp.skin = skin
			temp.width = 675;
			temp.x = -1;
			temp.y = 0;
			return temp;
		}

		private function btnClose_i():feathers.controls.Button
		{
			var temp:feathers.controls.Button = new feathers.controls.Button();
			btnClose = temp;
			temp.name = "btnClose";
			temp.right = 20;
			temp.styleClass = org.mokylin.skin.component.button.ButtonSkin_close;
			temp.top = 13;
			return temp;
		}

	}
}