package org.mokylin.skin.app.meiren
{
	import feathers.controls.Group;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class MeiRen_Select extends feathers.controls.StateSkin
	{
		public var imgBG:feathers.controls.Group;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function MeiRen_Select()
		{
			super();
			
			this.currentState = "normal";
			this.height = 101;
			this.width = 521;
			this.elementsContent = [imgBG_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __MeiRen_Select_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/pet/select_bg.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __MeiRen_Select_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.scaleX = -1;
			temp.styleName = "ui/pet/select_bg.png";
			temp.x = 121;
			temp.y = 0;
			return temp;
		}

		private function imgBG_i():feathers.controls.Group
		{
			var temp:feathers.controls.Group = new feathers.controls.Group();
			imgBG = temp;
			temp.name = "imgBG";
			temp.x = 200;
			temp.y = 0;
			temp.elementsContent = [__MeiRen_Select_UIAsset1_i(),__MeiRen_Select_UIAsset2_i()];
			return temp;
		}

	}
}