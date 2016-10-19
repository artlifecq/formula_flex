package org.mokylin.skin.app.biaoju
{
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import feathers.controls.UIAsset;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class BiaoJuLiShiJiLuItemRenderSkin extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var bg:feathers.controls.UIAsset;

		public var silver:feathers.controls.Label;

		public var time:feathers.controls.Label;

		public var type:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function BiaoJuLiShiJiLuItemRenderSkin()
		{
			super();
			
			this.currentState = "normal";
			this.height = 28;
			this.elementsContent = [bg_i(),time_i(),type_i(),silver_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function bg_i():feathers.controls.UIAsset
		{
			var temp:feathers.controls.UIAsset = new feathers.controls.UIAsset();
			bg = temp;
			temp.name = "bg";
			temp.styleName = "ui/app/biaoju/lie_biao_di.png";
			temp.x = 0;
			temp.y = 0;
			return temp;
		}

		private function silver_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			silver = temp;
			temp.name = "silver";
			temp.height = 20;
			temp.text = "充入本金";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 116;
			temp.x = 279;
			temp.y = 4;
			return temp;
		}

		private function time_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			time = temp;
			temp.name = "time";
			temp.height = 20;
			temp.text = "2016-04-26";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 116;
			temp.x = 17;
			temp.y = 4;
			return temp;
		}

		private function type_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			type = temp;
			temp.name = "type";
			temp.height = 20;
			temp.text = "充入本金";
			temp.textAlign = "center";
			temp.color = 0x6E3117;
			temp.width = 116;
			temp.x = 146;
			temp.y = 4;
			return temp;
		}

	}
}