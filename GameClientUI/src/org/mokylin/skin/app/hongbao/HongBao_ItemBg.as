package org.mokylin.skin.app.hongbao
{
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class HongBao_ItemBg extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg1:feathers.controls.UIAsset;

		public var bg2:feathers.controls.UIAsset;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function HongBao_ItemBg()
		{
			super();
			
			this.currentState = "normal";
			this.height = 31;
			this.width = 263;
			this.elementsContent = [bg1_i(),bg2_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg1_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg1 = temp;
			temp.name = "bg1";
			temp.styleName = "ui/app/hongbao/huitiao.png";
			temp.width = 263;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function bg2_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg2 = temp;
			temp.name = "bg2";
			temp.styleName = "ui/app/hongbao/chengtiao.png";
			temp.visible = false;
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

	}
}