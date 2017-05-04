package org.mokylin.skin.app.zhuangbei.xilian
{
	import feathers.controls.text.Fontter;
	import feathers.controls.Check;
	import feathers.controls.Label;
	import feathers.controls.StateSkin;
	import org.mokylin.skin.component.check.CheckBoxSkin_1;

	/**
	 * @private
	 * 此类由编译器自动生成，您应修改对应的DXML文件内容，然后重新编译，而不应直接修改其代码。
	 * @author DXMLCompilerForFeathers
	 */
	public class XiLianItem extends feathers.controls.StateSkin
	{
		//==========================================================================
		//                                定义成员变量
		//==========================================================================
		public var chk_suoding:feathers.controls.Check;

		public var lb_lock:feathers.controls.Label;

		public var lb_name:feathers.controls.Label;

		public var lb_name0:feathers.controls.Label;

		public var lb_yuanbao:feathers.controls.Label;


		//==========================================================================
		//                                定义构造函数
		//==========================================================================
		public function XiLianItem()
		{
			super();
			
			this.currentState = "normal";
			this.elementsContent = [lb_name_i(),lb_name0_i(),chk_suoding_i(),lb_yuanbao_i(),lb_lock_i()];
			
			states = {
			};
			skinNames={};
		}


		//==========================================================================
		//                                定义成员方法
		//==========================================================================
		private function chk_suoding_i():feathers.controls.Check
		{
			var temp:feathers.controls.Check = new feathers.controls.Check();
			chk_suoding = temp;
			temp.name = "chk_suoding";
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.styleClass = org.mokylin.skin.component.check.CheckBoxSkin_1;
			temp.color = 0xCFC6AE;
			temp.x = 350;
			temp.y = 0;
			return temp;
		}

		private function lb_lock_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_lock = temp;
			temp.name = "lb_lock";
			temp.text = "锁定";
			temp.color = 0xCFC6AE;
			temp.x = 377;
			temp.y = 2;
			return temp;
		}

		private function lb_name0_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name0 = temp;
			temp.name = "lb_name0";
			temp.height = 19;
			temp.text = "属性文本";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 340;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function lb_name_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_name = temp;
			temp.name = "lb_name";
			temp.height = 19;
			temp.text = "属性文本";
			temp.color = 0xCFC6AE;
			temp.nativeFilters = Fontter.filterObj["textFilterBlackGreen"];
			temp.width = 340;
			temp.x = 1;
			temp.y = 1;
			return temp;
		}

		private function lb_yuanbao_i():feathers.controls.Label
		{
			var temp:feathers.controls.Label = new feathers.controls.Label();
			lb_yuanbao = temp;
			temp.name = "lb_yuanbao";
			temp.height = 19;
			temp.text = "(10元宝/次)";
			temp.color = 0x25931b;
			temp.width = 89;
			temp.x = 412;
			temp.y = 2;
			return temp;
		}

	}
}