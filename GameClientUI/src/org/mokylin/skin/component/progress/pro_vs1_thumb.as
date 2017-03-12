package org.mokylin.skin.component.progress
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class pro_vs1_thumb extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bar:feathers.controls.UIAsset;

		public var thumb:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function pro_vs1_thumb()
		{
			super();
			
			this.currentState = "normal";
			this.height = 15;
			this.width = 114;
			this.elementsContent = [thumb_i(),bar_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bar_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bar = temp;
			temp.name = "bar";
			temp.styleName = "ui/app/beibao/vs/zuo_guang.png";
			temp.x = 108;
			temp.y = 0;
			return temp;
		}

		private function thumb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thumb = temp;
			temp.name = "thumb";
			temp.styleName = "ui/app/beibao/vs/zuo_tiao.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}