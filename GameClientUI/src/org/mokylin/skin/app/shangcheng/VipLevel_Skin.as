package org.mokylin.skin.app.shangcheng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class VipLevel_Skin extends feathers.controls.StateSkin
	{
		public var uiLevel:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VipLevel_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__VipLevel_Skin_UIAsset1_i(),uiLevel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __VipLevel_Skin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/shangcheng/vip.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiLevel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLevel = temp;
			temp.name = "uiLevel";
			temp.styleName = "ui/app/shangcheng/number/sz/0.png";
			temp.x = 23;
			temp.y = 0;
			return temp;
		}

	}
}