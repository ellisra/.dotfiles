return {
    require('mini.indentscope').setup({
        symbol = '▏',
        draw = {
            delay = 30,
            animation = require('mini.indentscope').gen_animation.none(),
        },
    }),
}
