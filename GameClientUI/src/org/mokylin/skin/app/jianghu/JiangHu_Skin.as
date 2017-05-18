package org.mokylin.skin.app.jianghu
{
	import feathers.data.ListCollection;
	import feathers.controls.SkinnableContainer;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;
	import feathers.layout.HorizontalLayout;
	import org.mokylin.skin.common.yiji_panelbg2_Skin;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiangHu_Skin extends feathers.controls.StateSkin
	{
		public var bg:feathers.controls.SkinnableContainer;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiangHu_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 587;
			this.width = 947;
			this.elementsContent = [bg_i(),__JiangHu_Skin_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiangHu_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.height = 499;
			temp.styleName = "ui/common/background/neikuang_1.png";
			temp.width = 922;
			temp.x = 14;
			temp.y = 69;
			return temp;
		}

		private function bg_i():feathers.controls.SkinnableContainer
		{
			var temp:feathers.controls.SkinnableContainer = new feathers.controls.SkinnableContainer();
			bg = temp;
			temp.name = "bg";
			temp.height = 587;
			var skin:StateSkin = new org.mokylin.skin.common.yiji_panelbg2_Skin()
			temp.skin = skin
			temp.width = 947;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}