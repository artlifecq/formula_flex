package org.mokylin.skin.app.banghui.wangcheng
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class WangCheng_BaoXiang extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var uiBaoXiang:feathers.controls.UIAsset;

		public var uiLingQu:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function WangCheng_BaoXiang()
		{
			super();
			
			this.currentState = "normal";
			this.height = 59;
			this.width = 154;
			this.elementsContent = [uiBaoXiang_i(),uiLingQu_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function uiBaoXiang_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiBaoXiang = temp;
			temp.name = "uiBaoXiang";
			temp.styleName = "ui/app/banghui/wangcheng/baoxiang.png";
			temp.x = 78;
			temp.y = 6;
			return temp;
		}

		private function uiLingQu_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			uiLingQu = temp;
			temp.name = "uiLingQu";
			temp.styleName = "ui/app/banghui/wangcheng/jinrifuliyilingqu.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}