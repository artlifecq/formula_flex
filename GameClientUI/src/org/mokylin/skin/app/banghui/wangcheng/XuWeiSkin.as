package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class XuWeiSkin extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XuWeiSkin()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [__XuWeiSkin_UIAsset1_i(),__XuWeiSkin_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __XuWeiSkin_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/banghui/wangcheng/heiying1.png";
			temp.top = 0;
			return temp;
		}

		private function __XuWeiSkin_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = -13;
			temp.styleName = "ui/app/banghui/wangcheng/xuxiyidai.png";
			temp.y = 80;
			return temp;
		}

	}
}