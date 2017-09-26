package org.mokylin.skin.common
{
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import org.mokylin.skin.common.TongYongHead3;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TongYongPanelbg4 extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TongYongPanelbg4()
		{
			super();
			
			this.currentState = "normal";
			this.width = 437;
			this.elementsContent = [bg_i(),__TongYongPanelbg4_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TongYongPanelbg4_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.styleName = "ui/common/background/tongyongV2_di.png";
			temp.top = 82;
			temp.width = 443;
			temp.x = -3;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 82;
			var skin:StateSkin = new org.mokylin.skin.common.TongYongHead3()
			temp.skin = skin
			temp.width = 437;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}