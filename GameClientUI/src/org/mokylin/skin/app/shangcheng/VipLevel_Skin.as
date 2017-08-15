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
		public var uiVIP:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function VipLevel_Skin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [uiVIP_i()];
			
			states = {
			};
			skinNames={};
		}


		private function uiVIP_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiVIP = temp;
			temp.name = "uiVIP";
			temp.styleName = "ui/app/shangcheng/1.png";
			temp.x = -6;
			temp.y = -7;
			return temp;
		}

	}
}