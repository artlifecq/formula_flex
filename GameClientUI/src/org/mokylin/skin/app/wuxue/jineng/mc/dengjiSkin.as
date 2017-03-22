package org.mokylin.skin.app.wuxue.jineng.mc
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class dengjiSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var __dengjiSkin_UIAsset1:feathers.controls.UIAsset;

		public var __dengjiSkin_UIAsset2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function dengjiSkin()
		{
			super();
			
			this.currentState = "1";
			this.height = 12;
			this.width = 9;
			this.elementsContent = [];
			__dengjiSkin_UIAsset1_i();
			__dengjiSkin_UIAsset2_i();
			
			
			states = {
			};
			skinNames={"1":"ui/app/wuxue/jineng/dengji/1.png", "2":"ui/app/wuxue/jineng/dengji/2.png"};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __dengjiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__dengjiSkin_UIAsset1 = temp;
			temp.styleName = "ui/app/wuxue/jineng/dengji/1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function __dengjiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			__dengjiSkin_UIAsset2 = temp;
			temp.styleName = "ui/app/wuxue/jineng/dengji/2.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}