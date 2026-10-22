# Chuleta de tmux

Configuración: prefijo `Ctrl+a`, ventanas y paneles desde 1, teclas vim. "Prefijo + x" = pulsar `Ctrl+a`, soltar, y luego `x`.

## Conceptos

- **Sesión**: espacio de trabajo completo. Sobrevive aunque cierres la terminal.
- **Ventana**: como una pestaña dentro de la sesión.
- **Panel**: división dentro de una ventana.

## Sesiones

| Acción | Comando / teclas |
|---|---|
| Crear o abrir sesión | `tm nombre` (o `tmux new -s nombre`) |
| Listar sesiones | `tmux ls` |
| Conectarte | `tmux attach -t nombre` |
| Desconectarte (sigue viva) | prefijo + `d` |
| Cambiar de sesión | prefijo + `s` |
| Renombrar sesión | prefijo + `$` |
| Matar sesión | `tmux kill-session -t nombre` |

## Ventanas

| Acción | Teclas |
|---|---|
| Nueva ventana | prefijo + `c` |
| Ir a la ventana N | prefijo + `1`…`9` |
| Anterior / siguiente | prefijo + `Ctrl+h` / `Ctrl+l` |
| Renombrar | prefijo + `,` |
| Lista de ventanas | prefijo + `w` |
| Cerrar ventana | prefijo + `&` |

## Paneles

| Acción | Teclas |
|---|---|
| Dividir en vertical (lado a lado) | prefijo + `\|` |
| Dividir en horizontal (arriba/abajo) | prefijo + `-` |
| Moverte | prefijo + `h` `j` `k` `l` |
| Redimensionar | prefijo + `H` `J` `K` `L` |
| Maximizar / restaurar | prefijo + `z` |
| Cerrar panel | prefijo + `x` |
| Cambiar disposición | prefijo + `Espacio` |
| Mostrar números | prefijo + `q` |
| Panel a ventana | prefijo + `!` |

## Modo copia (estilo vim)

| Acción | Teclas |
|---|---|
| Entrar | prefijo + `v` |
| Moverte | `h j k l`, `w` `b`, `0` `$`, `gg` `G`, `Ctrl+u` `Ctrl+d` |
| Buscar | `/texto` hacia abajo, `?texto` hacia arriba, `n` `N` |
| Empezar selección | `v` |
| Selección rectangular | `Ctrl+v` |
| Copiar y salir | `y` |
| Salir sin copiar | `Esc` o `q` |
| Pegar | prefijo + `]` |

## Línea de comandos de tmux

prefijo + `:` y luego, por ejemplo:

- `new-window -n logs`
- `split-window -h`
- `setw synchronize-panes on` (escribir en todos los paneles; `off` para desactivar)

## Utilidades

| Acción | Teclas / comando |
|---|---|
| Ver todos los atajos | prefijo + `?` |
| Recargar configuración | prefijo + `r` |
| Ver cambios respecto a lo estándar | `tmux-cambios` |

## Plugins (TPM)

| Acción | Teclas |
|---|---|
| Instalar plugins nuevos | prefijo + `I` |
| Actualizar plugins | prefijo + `U` |
| Guardar sesión (resurrect) | prefijo + `Ctrl+s` |
| Restaurar sesión (resurrect) | prefijo + `Ctrl+r` |

tmux-continuum guarda automáticamente cada 10 minutos y restaura al arrancar el servidor.
