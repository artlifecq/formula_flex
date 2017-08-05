package org.mokylin.skin.app.wuxue.jineng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class JiNeng_Head extends feathers.controls.StateSkin
	{
		public var labelDisplay:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function JiNeng_Head()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.width = 466;
			this.elementsContent = [labelDisplay_i(),__JiNeng_Head_UIAsset1_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __JiNeng_Head_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/app/wuxue/jineng/kuantiao.png";
			temp.width = 466;
			temp.x = 0;
			temp.y = 23;
			return temp;
		}

		private function labelDisplay_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			labelDisplay = temp;
			temp.name = "labelDisplay";
			temp.styleName = "ui/app/wuxue/jineng/name1.png";
			temp.x = 10;
			temp.y = 0;
			return temp;
		}

	}
}