package org.mokylin.skin.app.zhanchang.wangchengzhengba
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class XuWei extends feathers.controls.StateSkin
	{

		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XuWei()
		{
			super();
			
			this.currentState = "normal";
			this.height = 340;
			this.width = 216;
			this.elementsContent = [__XuWei_UIAsset1_i(),__XuWei_UIAsset2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __XuWei_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.bottom = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/zhanchang/weicheng/heiying1.png";
			temp.top = 0;
			return temp;
		}

		private function __XuWei_UIAsset2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.horizontalCenter = -13;
			temp.styleName = "ui/app/zhanchang/weicheng/xuxiyidai.png";
			temp.y = 80;
			return temp;
		}

	}
}