package org.mokylin.skin.app.zhanchang.dianfengduijue
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class Pro_duanwei extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var thumb:feathers.controls.UIAsset;

		public var track:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function Pro_duanwei()
		{
			super();
			
			this.currentState = "normal";
			this.height = 18;
			this.width = 164;
			this.elementsContent = [track_i(),thumb_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function thumb_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			thumb = temp;
			temp.name = "thumb";
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/zhanchang/dianfengduijue/jindutiao.png";
			temp.top = 0;
			return temp;
		}

		private function track_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			track = temp;
			temp.name = "track";
			temp.alpha = 0;
			temp.left = 0;
			temp.right = 0;
			temp.styleName = "ui/app/zhanchang/dianfengduijue/jindutiao.png";
			temp.top = 0;
			return temp;
		}

	}
}