package org.mokylin.skin.app.zhuangbei.qianghua
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class TitileHead extends feathers.controls.StateSkin
	{
		public var uiLabel:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function TitileHead()
		{
			super();
			
			this.currentState = "normal";
			this.height = 27;
			this.width = 333;
			this.elementsContent = [__TitileHead_UIAsset1_i(),uiLabel_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function __TitileHead_UIAsset1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			temp.styleName = "ui/common/titilebg/headbg1.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function uiLabel_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLabel = temp;
			temp.name = "uiLabel";
			temp.styleName = "ui/app/zhuangbei/daiqianghua.png";
			temp.x = 30;
			temp.y = 4;
			return temp;
		}

	}
}